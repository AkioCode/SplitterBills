<h1 align="center">
  <br>
  SplitterBills
  <br>
</h1>

**🍷 An Elixir application that provides an balanced bills splitting to avoid losing friends/relationships.**

## Features
- Command line interface (CLI)
- Generate random list of N items and M e-mails from code
- Generate random list of N items and M e-mails from files

## Requirements
- [Elixir](https://elixir-lang.org/install.html)
- [Git](https://git-scm.com)

## Installation
In the guide below I am ilustrating the step-by-step to installation the SplitterBills (_I am using Windows 10 and that's the reason I needed to call escript.exe to run the executable.This took me a long time and headache to figure out_ 🤯).
```powershell
# Clone this repository
$ git clone https://github.com/AkioCode/SplitterBills.git

# Navigate to the program's directory
$ cd path\to\SplitterBills\

# Build the app
$ mix deps

# Build the executable
$ mix escript.build

# Run the app
$ path/to/escript.exe .\commandline 
        "--mode, -m (l - Load file | r - Random)",
        "--emailsFile, -e_f path/to/emailsFile",
        "--itemsFile, -i_f path/to/itemsFile",
        "--emails, -e",
        "--items, -i"
```

## How to use
```powershell
# Load random data from files, 4 e-mails and 10 items
$ path/to/escript.exe .\commandline --mode l --emailsFile data/emails.csv --itemsFile data/items.csv --emails 4 --items 10

# Load random data from code, 4 e-mails and 10 items
$ path/to/escript.exe .\commandline --mode r --emails 4 --items 10

# You can also use it with iex:
$ iex.bat -S mix
iex(1)> emailList = ["clumsy-penguin@mail.com","grumpy-seagull@mail.com","happy-whale@mail.com"]
["clumsy-penguin@mail.com","grumpy-seagull@mail.com","happy-whale@mail.com"]

iex(2)> itemList = [%{features: %{price: 200, quantity: 2}, name: "rice"},%{features: %{price: 100, quantity: 2}, name: "bread"},%{features: %{price: 400, quantity: 2}, name: "cheese"},%{features: %{price: 300, quantity: 2}, name: "ram"}]
[
  %{features: %{price: 200, quantity: 2}, name: "rice"},
  %{features: %{price: 100, quantity: 2}, name: "bread"},
  %{features: %{price: 400, quantity: 2}, name: "cheese"},
  %{features: %{price: 300, quantity: 2}, name: "ram"}
]

iex(3)> Splitbills.splitBills(itemList, emailList)
Total: 2000
Remainder: 2
Split bill: 666
Result: [%{bill: "$6,66", email: "clumsy-penguin@mail.com"}, %{bill: "$6,67", email: "grumpy-seagull@mail.com"}, %{bill: "$6,67", email: "happy-whale@mail.com"}]
[
  %{bill: "$6,66", email: "clumsy-penguin@mail.com"},
  %{bill: "$6,67", email: "grumpy-seagull@mail.com"},
  %{bill: "$6,67", email: "happy-whale@mail.com"}
]
```
## Data files format
The data files format are .csv, delimited by commas, with header, located at .\data\ directory. You need to remove the commas if the name contains it (Need to fix this 😶).
```csv
name,price,quantity
Food Colouring - Orange,310,5
Cheese - Woolwich Goat,265,6
```
## Testing
You may want to run some tests, so here we go:
```powershell
# At the .\SplitterBills\ directory, run:
$ mix test
```

## License

🏛 MIT

---