<!-- CSS -->
<link rel="stylesheet" href="/css/jquery.steps.css">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/normalize.css">
<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>
<script src="/js/jquery.steps.min.js"></script>

<form id="wizard"></form>

<script>
    $(function() {
        // wizardの初期化
        function initWizard() {
            $("#wizard").validate();
            $("#wizard").steps({
                headerTag: "h1",
                bodyTag: "section",
                onStepChanging: function (event, currentIndex, newIndex) {
                    if (currentIndex < newIndex) {
                        return $('#wizard').valid();
                    } else {
                        return true;
                    }
                },
                onStepChanged: function (event, currentIndex, priorIndex) {
                    if (currentIndex < priorIndex) {
                        // 削除
                        const currentSection = $(`#wizard-p-${currentIndex}`);
                        const checkedBoxes = currentSection.find("input[type=checkbox]:checked");
                        $.each(checkedBoxes, function(index, checkedBox) {
                            const addQuestionId = $(checkedBox).data('addQuestionId');
                            if (addQuestionId) {
                                getQuestionsById(addQuestionId, (questions) => {
                                    removeContents(questions)
                                });
                            }
                        })
                    } else {
                        // 追加
                        const priorSection = $(`#wizard-p-${priorIndex}`);
                        const checkedBoxes = priorSection.find("input[type=checkbox]:checked");
                        $.each(checkedBoxes, function(index, checkedBox) {
                            const addQuestionId = $(checkedBox).data('addQuestionId');
                            if (addQuestionId) {
                                getQuestionsById(addQuestionId, (questions) => {
                                    addContents(questions)
                                });
                            }
                        })
                    }
                }
            });
        }

        function getQuestionsById(questionId, callback) {
            let ajaxURL = `http://localhost/api/questions/${questionId}`;

            $.ajax({
                method  : "GET",
                url     : ajaxURL
            }).done(function(questions) {
                callback(questions);
            }).fail(function(err) {
                // Handle ajax error
                console.log(err);
            });
        }

        function addContents(questions) {
            $.each(questions, function(index, question) {
                // HTMLの構築
                $("#wizard").steps('add', {
                    title: question.title,
                    content: createContent(question)
                })
                // HTMLを描画してからバリデーションを設定する
                addValidateRule(question);
            })
            // チェックボックスの制御(wizardの初期化後に呼び出すこと)
            setupCheckboxControl();
        }

        function removeContents(questions) {
            $.each(questions, function(index, question) {
                const sections = $(`#question${question.id}`).parents('section');
                $.each(sections, function(index, section) {
                    const removeIndex = section.id.replace('wizard-p-', '');
                    $("#wizard").steps('remove', Number(removeIndex));
                });
                removeValidateRule(question);
            })
            // チェックボックスの制御(wizardの初期化後に呼び出すこと)
            setupCheckboxControl();
        }

        function createContent(question) {
            return `<div id="question${question.id}">
                        <input type="hidden" value="${question.selectable_answers}" />
                        <p>${question.body}</p>
                        ${$.map(question.answers, function(answer, index) {
                return createAnswer(answer);
            }).join('')}
                        ${question.note ?? ''}
                    </div>`;
        }

        function createAnswer(answer) {
            if(answer.image) {
                return createImageAnswer(answer);
            } else {
                return createDefaultAnswer(answer);
            }
        }

        function createDefaultAnswer(answer) {
            return `<div id="answer${answer.id}" class="answer">
                        <input type="checkbox" id="checkbox-${answer.id}" name="question${answer.question_id}" data-add-question-id="${answer.add_question_id}">
                        <label for="checkbox-${answer.id}">${answer.name}</label>
                        ${answer.extra_field ?? ''}
                    </div>`;
        }

        function createImageAnswer(answer) {
            return `<div id="answer${answer.id}" class="answer">
                        <input type="checkbox" id="checkbox-${answer.id}" name="question${answer.question_id}" style="display:none;" data-add-question-id="${answer.add_question_id}">
                        <label for="checkbox-${answer.id}">
                            <img src="data:image/jpeg;base64,${answer.image}" />
                            <p>${answer.name}</p>
                        </label>
                    </div>`;
        }

        function addValidateRule(question) {
            const rules = question.validation.rules;
            rules.messages = question.validation.messages;
            $(`[name=question${question.id}]`).each(function() {
                $(this).rules('add', rules);
            });
        }

        function removeValidateRule(question) {
            const rules = question.validation.rules;
            $(`[name=question${question.id}]`).each(function() {
                $.each(rules, function(key, value) {
                    $(this).rules('remove', key);
                });
            });
        }

        function setupCheckboxControl() {
            $("input[type=checkbox]").click(function() {
                const questionId = $(this).attr('name');
                const question = $(this).parents(`#${questionId}`)
                const selectableAnswers = question.find(":hidden").val();

                const count = question.find("input[type=checkbox]:checked").length;
                const not = question.find("input[type=checkbox]").not(':checked').parents('.answer').children('input');

                // チェックが付いたら、チェックされてないチェックボックスにdisabledを加える
                if(count >= selectableAnswers) {
                    not.attr("disabled", true);
                } else {
                    // disabledを外す
                    not.attr("disabled", false);
                }
            });
        }

        initWizard();

        getQuestionsById(4, (questions) => {
            addContents(questions)
        });
    });

</script>

<style>
    .wizard .content {
        min-height: 100px;
    }
    .wizard .content > .body {
        width: 100%;
        height: auto;
        padding: 15px;
        position: absolute;
    }
    .wizard .content .body.current {
        position: relative;
    }
    /* チェック中のラベルにCSSを適用 */
    input:checked + label img {
        border: 2px solid red;
    }
</style>
