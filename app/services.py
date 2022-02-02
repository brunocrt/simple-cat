from models import Questionaire
import random


def get_next_question(questionarie, answer):
    
    topics = questionarie.topics

    if(topics != None):

        if(answer == None or answer is None):
            # return the last question for the first topic (most complex question of the topic)
            t = topics[0]
            return t.unanswered_questions[len(t.unanswered_questions)-1]
        else:
            current_topic_id = answer.question.topic_id - 1
            next_topic_id = current_topic_id
            previous_topic_id = current_topic_id - 1
            last_topic_id = len(topics) - 1

            previous_topic_questions = topics[previous_topic_id].unanswered_questions
            current_topic_questions = topics[current_topic_id].unanswered_questions
            next_topic_questions = topics[next_topic_id].unanswered_questions

            print("total previous: " + str(len(previous_topic_questions)))
            print("total current: " + str(len(current_topic_questions)))
            print("total next: " + str(len(next_topic_questions)))

            # capture the answer before this last answer
            previous_answer = questionarie.get_previous_answer(2)

            if(questionarie.number_answered_questions == questionarie.min_number_questions):
                return None

            # if right answer
            if(answer.isCorrect()):
                # if last topic get previous question until reach the minimum amount of questions answer
                if(current_topic_id == last_topic_id):

                    # if the first question of first topic
                    if(current_topic_id == 0 and answer.question.sequence == 0):
                        # get next question of same topic
                        return current_topic_questions[answer.question.sequence+1]

                    # if first question of the same topic
                    if(answer.question.sequence == 0):
                        # jump to previous topic last question
                        return previous_topic_questions[len(previous_topic_questions)-1]
                    else:
                        # get previous question of same topic
                        return current_topic_questions[answer.question.sequence-1]

                # if last answer was correct jump to most complex question of the next topic
                return next_topic_questions[len(next_topic_questions)-1]

            else:

                # if first question jump to previous topic
                if(answer.question.sequence == 0 and previous_topic_id > -1):
                    # jump to previous topic last question
                    return previous_topic_questions[len(previous_topic_questions)-1]

                # if in same topic but not on last question, move to the next one
                if(previous_answer.isCorrect()):

                    # if answer didnt reach the end of this topic
                    if(answer.question.sequence < len(current_topic_questions)-1):
                        return current_topic_questions[answer.question.sequence]
                    else:
                        # finish
                        return None
                else:
                    # if answer was wrong keep on lesser complex question of same topic
                    if(answer.question.sequence-1 > 0):
                        return current_topic_questions[answer.question.sequence-1]
                    else:
                        # choose a random number from total of questions
                        return current_topic_questions[random.randint(0, len(current_topic_questions)-1)]
