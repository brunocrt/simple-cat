import operator

class Questionaire:
    def __init__(self, name, min_number_questions):
        self.name = name
        self.topics = []
        self.last_answers = []
        self.min_number_questions = min_number_questions
        self.number_answered_questions = 0
    def add_topic(self, topic):
        if(topic.id == 0):
            topic.id = len(self.topics) + 1
        self.topics.append(topic) 
    def get_topic_by_id(self, topic_id):
        for t in self.topics:
            if(t.id == topic_id):
                return t
    def add_answer(self, topic_id, answer):
        topic = self.get_topic_by_id(topic_id)
        topic.add_answer(answer)
        self.number_answered_questions = self.number_answered_questions + 1
        self.last_answers.append(answer)
    def get_previous_answer(self, index):
        return self.last_answers[len(self.last_answers)-index]

class Topic:
    def __init__(self, name):
        self.id = 0
        self.name = name
        self.questions = []
        self.unanswered_questions = []
        self.answers = []
    def __init__(self, id, name):
        self.id = id
        self.name = name
        self.questions = []
        self.unanswered_questions = []
        self.answers = []
    def add_question(self, question):
        question.topic = self.id

        # if question doesn't have an id create one
        if(question.id == 0):
            question.id = len(self.questions) + 1

        # add question to the list
        self.questions.append(question)

        # sort list by complexity number
        self.questions.sort(key=operator.attrgetter('complexity'))

        # define sequence based on order list
        sequence = 0        
        for q in self.questions:
            q.sequence = sequence
            sequence = sequence + 1

        # update the list of unanswered_questions
        self.unanswered_questions += self.questions

    def add_answer(self, answer):
        # store the answer for the topic
        self.answers.append(answer)
        # remove the question from unanswered_questions list
        for uq in self.unanswered_questions:
            if(uq.id == answer.question.id):
                self.unanswered_questions.remove(uq)

    def  get_questions(self):
        return self.questions

class Question:
    def __init__(self):
        self.id = 0
        self.topic_id = 0
        self.sequence = 0
        self.complexity = 0
        self.text = ""
        self.options = []
        self.answer_index = 0
    def __init__(self, id, topic_id, complexity, text, options, answer_options_index):
        self.id = id
        self.topic_id = topic_id
        self.complexity = complexity
        self.text = text
        self.options = options
        self.answer_index = answer_options_index
    def __lt__(self, other):
        return self.complexity < other.complexity
    def __repr__(self):
        return "C"+str(self.complexity)+"R"+str(self.answer_index)+" '"+self.text+"'"

class Option:
    def __init__(self, text):
        self.text = text

class Answer:
    def __init__(self):
        self.question = {}
        self.options = []
        self.response_index = 0
    def __init__(self, question, options, response_options_index):
        self.question = question
        self.options = options
        self.response_index = response_options_index
    def __repr__(self):
        return "C"+str(self.question.complexity)+"R"+str(self.response_index)+" '"+self.question.text+"'"
    def isCorrect(self):
        return self.question.answer_index == self.response_index