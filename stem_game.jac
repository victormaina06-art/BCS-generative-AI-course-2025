# STEM World Game in Jac
import random;

obj Question {
    has text: str,
        subject: str,
        choices: list,
        answer: str;
}

glob questions = [
    Question(
        "What is the chemical symbol for water?",
        "Chemistry",
        ["A) H2O", "B) CO2", "C) O2", "D) NaCl"],
        "A"
    ),
    Question(
        "What is 7 x 8?",
        "Maths",
        ["A) 54", "B) 56", "C) 64", "D) 58"],
        "B"
    ),
    Question(
        "What organ pumps blood through the body?",
        "Biology",
        ["A) Brain", "B) Liver", "C) Heart", "D) Lung"],
        "C"
    ),
    Question(
        "What is the force that keeps us on the ground?",
        "Physics",
        ["A) Magnetism", "B) Gravity", "C) Friction", "D) Electricity"],
        "B"
    )
];

def play_game() {
    print("Welcome to STEM World!");
    score = 0;
    for i in range(10) {
        idx = random.randint(0, len(questions) - 1);
        q = questions[idx];
        print(f"\nQuestion {i+1}: {q.text}");
        print("Which subject does this question belong to? (Maths, Physics, Chemistry, Biology)");
        user_subject = input();
        if user_subject.lower() != q.subject.lower() {
            print("Try again next time.");
            continue;
        }
        print("Great! Now choose the correct answer:");
        for choice in q.choices {
            print(choice);
        }
        print("Enter your choice (A, B, C, D):");
        user_answer = input().upper();
        if user_answer != q.answer {
            print("Try again next time.");
        } else {
            print("You are a genius, congratulations!");
            score += 1;
        }
    }
    print(f"\nGame Over! Your score: {score}/10");
}

with entry {
    play_game();
}
