import 'package:flutter/material.dart';

// Enum to represent possible answers
enum AnswerOption { a, b, c, d }

class QuizPage extends StatefulWidget {
  @override
  _FootballQuizPageState createState() => _FootballQuizPageState();
}

class _FootballQuizPageState extends State<QuizPage> {
  AnswerOption? _selectedOption;
  int _score = 0;
  int _questionIndex = 0;
  bool _answerSelected = false;  // To track if an answer has been selected
  bool _showCorrectAnswer = false;  // To show the correct answer if wrong

  // List of football questions with images of players
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Who is known as "The King of Football"?',
      'image': 'assets/images/pele.jpg', // Image of Pele
      'answers': [
        {'text': 'Lionel Messi', 'value': AnswerOption.a},
        {'text': 'Cristiano Ronaldo', 'value': AnswerOption.b},
        {'text': 'Diego Maradona', 'value': AnswerOption.c},
        {'text': 'Pele', 'value': AnswerOption.d},
      ],
      'correctAnswer': AnswerOption.d,
    },
    {
      'question': 'Who is the top scorer in the history of the Premier League?',
      'image': 'assets/images/alan_shearer.jpg', // Image of Alan Shearer
      'answers': [
        {'text': 'Alan Shearer', 'value': AnswerOption.a},
        {'text': 'Thierry Henry', 'value': AnswerOption.b},
        {'text': 'Sergio Aguero', 'value': AnswerOption.c},
        {'text': 'Wayne Rooney', 'value': AnswerOption.d},
      ],
      'correctAnswer': AnswerOption.a,
    },
    {
      'question': 'Who won the 2018 FIFA World Cup?',
      'image': 'assets/images/france.jpg', // Image of Kylian Mbappé
      'answers': [
        {'text': 'Brazil', 'value': AnswerOption.a},
        {'text': 'Germany', 'value': AnswerOption.b},
        {'text': 'France', 'value': AnswerOption.c},
        {'text': 'Argentina', 'value': AnswerOption.d},
      ],
      'correctAnswer': AnswerOption.c,
    },
    {
      'question': 'Which club does Cristiano Ronaldo play for in premier league?',
      'image': 'assets/images/cristiano_ronaldo.jpg', // Image of Cristiano Ronaldo
      'answers': [
        {'text': 'Barcelona', 'value': AnswerOption.a},
        {'text': 'Real Madrid', 'value': AnswerOption.b},
        {'text': 'Manchester United', 'value': AnswerOption.c},
        {'text': 'Juventus', 'value': AnswerOption.d},
      ],
      'correctAnswer': AnswerOption.c,
    },
    {
      'question': 'Who is the most successful manager in Premier League history?',
      'image': 'assets/images/sir_alex_ferguson.jpg', // Image of Sir Alex Ferguson
      'answers': [
        {'text': 'Arsène Wenger', 'value': AnswerOption.a},
        {'text': 'José Mourinho', 'value': AnswerOption.b},
        {'text': 'Sir Alex Ferguson', 'value': AnswerOption.c},
        {'text': 'Pep Guardiola', 'value': AnswerOption.d},
      ],
      'correctAnswer': AnswerOption.c,
    },
    // New Questions added below:

    {
      'question': 'Who is known as the greatest player of all time?',
      'image': 'assets/images/messi.jpg', // Image of Lionel Messi
      'answers': [
        {'text': 'Lionel Messi', 'value': AnswerOption.a},
        {'text': 'Cristiano Ronaldo', 'value': AnswerOption.b},
        {'text': 'Neymar Jr', 'value': AnswerOption.c},
        {'text': 'Diego Maradona', 'value': AnswerOption.d},
      ],
      'correctAnswer': AnswerOption.a,
    },
    {
      'question': 'Which club is Cristiano Ronaldo associated with?',
      'image': 'assets/images/cristiano_ronaldo.jpg', // Another image of Cristiano Ronaldo
      'answers': [
        {'text': 'Manchester City', 'value': AnswerOption.a},
        {'text': 'Inter Milan', 'value': AnswerOption.b},
        {'text': 'Manchester United', 'value': AnswerOption.c},
        {'text': 'Paris Saint-Germain', 'value': AnswerOption.d},
      ],
      'correctAnswer': AnswerOption.c,
    },
    {
      'question': 'Who is the French legend who scored the winning goal in the 1998 World Cup?',
      'image': 'assets/images/zidane.jpg', // Image of Zinedine Zidane
      'answers': [
        {'text': 'David Beckham', 'value': AnswerOption.a},
        {'text': 'Zinedine Zidane', 'value': AnswerOption.b},
        {'text': 'Kylian Mbappé', 'value': AnswerOption.c},
        {'text': 'Thierry Henry', 'value': AnswerOption.d},
      ],
      'correctAnswer': AnswerOption.b,
    },
    {
      'question': 'Which Brazilian star is known for his flair and trickery?',
      'image': 'assets/images/neymar.jpg', // Image of Neymar
      'answers': [
        {'text': 'Neymar Jr', 'value': AnswerOption.a},
        {'text': 'Ronaldinho', 'value': AnswerOption.b},
        {'text': 'Roberto Carlos', 'value': AnswerOption.c},
        {'text': 'Kaká', 'value': AnswerOption.d},
      ],
      'correctAnswer': AnswerOption.a,
    },
    {
      'question': 'Which young French player is seen as the future of football?',
      'image': 'assets/images/mbappe_2.jpg', // Image of Kylian Mbappé
      'answers': [
        {'text': 'Paul Pogba', 'value': AnswerOption.a},
        {'text': 'Kylian Mbappé', 'value': AnswerOption.b},
        {'text': 'Antoine Griezmann', 'value': AnswerOption.c},
        {'text': 'Olivier Giroud', 'value': AnswerOption.d},
      ],
      'correctAnswer': AnswerOption.b,
    },
  ];

  void _checkAnswer() {
    if (_selectedOption == _questions[_questionIndex]['correctAnswer']) {
      setState(() {
        _score++;
      });
    }

    setState(() {
      _answerSelected = true;  // Mark answer as selected
      _showCorrectAnswer = _selectedOption != _questions[_questionIndex]['correctAnswer'];
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < _questions.length - 1) {
        _questionIndex++;
        _selectedOption = null;
        _answerSelected = false;  // Reset answer state
        _showCorrectAnswer = false;  // Hide correct answer state
      } else {
        _showScore();
      }
    });
  }

  void _showScore() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Quiz Finished'),
        content: Text('Your score is $_score/${_questions.length}.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(() {
                _questionIndex = 0;
                _score = 0;
                _selectedOption = null;
                _answerSelected = false;
                _showCorrectAnswer = false;
              });
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: const Text(
          'Football Quiz',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Quiz Content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Displaying the image of the player only after the answer is selected
                if (_answerSelected)
                  Image.asset(
                    _questions[_questionIndex]['image'],
                    width: 200,
                    height: 200,
                  ),
                const SizedBox(height: 20),
                Text(
                  'Question ${_questionIndex + 1}/${_questions.length}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 20),
                Text(
                  _questions[_questionIndex]['question'],
                  style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Column(
                  children: _questions[_questionIndex]['answers'].map<Widget>((answer) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedOption = answer['value'];
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: _selectedOption == answer['value']
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: _selectedOption == answer['value']
                              ? Colors.blueGrey[900]
                              : Colors.green[100],
                          padding: const EdgeInsets.all(16),
                          fixedSize: const Size(200, 60),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text(answer['text'], style: const TextStyle(fontSize: 22)),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _answerSelected ? _nextQuestion : _checkAnswer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[200],
                  ),
                  child: Text(
                    _answerSelected ? 'Next Question' : 'Submit Answer',
                    style: const TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
                if (_showCorrectAnswer)
                  Text(
                    'Correct answer: ${_questions[_questionIndex]['answers'].firstWhere((answer) => answer['value'] == _questions[_questionIndex]['correctAnswer'])['text']}',
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
