from models import Questionaire, Topic, Question, Option, Answer
import app.services as services

questionarie = Questionaire("Prova de Matematica",15)

topic1 = Topic(1,"Soma")
topic2 = Topic(2,"Subtracao")
topic3 = Topic(3,"Multiplicacao")
topic4 = Topic(4,"Divisao")

questionarie.add_topic(topic1)
questionarie.add_topic(topic2)
questionarie.add_topic(topic3)
questionarie.add_topic(topic4)

topic1.add_question(Question(1,1,1,"Quanto e 1+2?", [Option("3"), Option("2"), Option("4"), Option("5")], 1))
topic1.add_question(Question(2,1,2,"Quanto e 10+20?", [Option("10"), Option("30"), Option("40"), Option("50")], 2))
topic1.add_question(Question(3,1,3,"Quanto e 100+200?", [Option("200"), Option("100"), Option("300"), Option("400")], 3))
topic1.add_question(Question(4,1,4,"Quanto e 1000+2000?", [Option("2000"), Option("1000"), Option("4000"), Option("3000")], 4))
topic1.add_question(Question(5,1,2,"Quanto e 40+50?", [Option("70"), Option("80"), Option("90"), Option("50")], 3))

topic2.add_question(Question(1,2,1,"Quanto e 1-2?", [Option("-1"), Option("2"), Option("4"), Option("5")], 1))
topic2.add_question(Question(2,2,2,"Quanto e 10-20?", [Option("20"), Option("-10"), Option("50"), Option("25")], 2))
topic2.add_question(Question(3,2,3,"Quanto e 100-200", [Option("400"), Option("200"), Option("-100"), Option("500")], 3))
topic2.add_question(Question(4,2,4,"Quanto e 1000-2000", [Option("1000"), Option("2000"), Option("4000"), Option("-1000")], 4))
topic2.add_question(Question(5,2,1,"Quanto e 3-5", [Option("6"), Option("8"), Option("9"), Option("7")], 2))

topic3.add_question(Question(1,3,1,"Quanto e 1x2?", [Option("2"), Option("3"), Option("4"), Option("5")], 1))
topic3.add_question(Question(2,3,2,"Quanto e 10x20?", [Option("20"), Option("200"), Option("50"), Option("25")], 2))
topic3.add_question(Question(3,3,3,"Quanto e 100x200", [Option("400"), Option("200"), Option("20000"), Option("500")], 3))
topic3.add_question(Question(4,3,4,"Quanto e 1000x2000", [Option("1000"), Option("2000"), Option("4000"), Option("20000000")], 4))
topic3.add_question(Question(5,3,4,"Quanto e 1000x3000", [Option("30000000"), Option("2000"), Option("4000"), Option("30000")], 1))

topic4.add_question(Question(1,4,1,"Quanto e 1/2?", [Option("0.5"), Option("2"), Option("4"), Option("5")], 1))
topic4.add_question(Question(2,4,2,"Quanto e 10/20?", [Option("20"), Option("0.5"), Option("50"), Option("25")], 2))
topic4.add_question(Question(3,4,3,"Quanto e 100/200", [Option("400"), Option("200"), Option("0.5"), Option("500")], 3))
topic4.add_question(Question(4,4,4,"Quanto e 1000/2000", [Option("1000"), Option("2000"), Option("4000"), Option("0.5")], 4))

answer = None

q = services.get_next_question(questionarie, answer)

while(q != None):

    print(str(questionarie.number_answered_questions+1) + ") " +q.text)
    print("\n----------------------------")
    option_index = 1
    for o in q.options:
        print( str(option_index) + " - " + o.text )
        option_index = option_index + 1

    answer_input = input("Resposta: ")

    if(answer_input == None or answer_input == "" or answer_input.isnumeric() == False):
        raise Exception("Not a valid answer option")

    answer = Answer(q, q.options, int(answer_input))
    questionarie.add_answer(q.topic_id, answer)
    q = services.get_next_question(questionarie, answer)

print("\n\n==== Test Finished! ====\n\n")


for t in questionarie.topics:
    print("Answers for Topic: "+ t.name)
    print("--------------------------")
    
    for a in t.answers:        
        answer_status = "WRONG"
        if(a.question.answer_index == a.response_index):
            answer_status = "CORRECT"

        if( (a.response_index-1) >= len(a.question.options) or (a.response_index-1) < 0 ):
            print(a.question.text+ " - Invalid answer: "+str(a.response_index))
        else:
            print( "C" + str(a.question.complexity) + " " + a.question.text+ " - "  + str(a.question.options[a.response_index-1].text) + " - " + answer_status + "\n")