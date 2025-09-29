import from byllm { Model }
glob llm = Model(model_name="gemini/gemini-2.5-flash");

enum Bloodgroup {
    B,
    O,
    AB
    #This is where you store choices when you ask the model a question like what was mike tyson blood croups
}

def get_bloodgroup(name: str) -> Bloodgroup by llm();

with entry {
    name = input("Enter name  to show their blood group::");
    result = get_bloodgroup(name);
    print(f"{result} detected for {name}");
}