defmodule Fakelist do
  @moduledoc """
  ...

  This module provides lists of items and e-mails generate
  ramdomly from hardcoded data
  """

  #@doc """
  #
  # Alternative version of genFakeList with recursion
  #"""
  # def genFakeList(fakeList, 0) do
  #   fakeList
  # end
  # def genFakeList(fakeList, n) when n >= 1 do
  #     genFakeList([genFakeItem()|fakeList], n-1)
  # end

  @doc """

  Generates ramdom lists of e-mails and items
  """
  @spec genFakeList(integer, any) :: [any]
  def genFakeList(0, _type), do: []
  def genFakeList(n, type) when is_integer(n) and type=="emails" do
      fakeList = Enum.map(1..n, fn _i -> genFakeEmail() end)
      fakeList
  end
  def genFakeList(n,type) when is_integer(n) and  type=="items" do
      fakeList = Enum.map(1..n, fn _i -> genFakeItem() end)
      fakeList
  end
  def genFakeList(_n,_type), do: raise("Invalid type, try again !")

  @spec genFakeItem :: %{features: %{price: any, quantity: any}, name: any}
  defp genFakeItem() do
    products = [
      "Dish towel","Iron","Ironing board","Scrub brush","Cloth","Sponge","Bleach","Liquid soap","Rubber gloves","Trash can","Broom","Dustpan","Mop","Squeegee mop","Hose","Bucket","Laundry basket","Washing machine","Carrot","Brussels sprout","Pumpkin","Cabbage","Potato","Eggplant","Sweet potato","Turnip","Green chilli","Onion","Lettuce","Radish","Pea","Asparagus","Celery","Green pepper","French beans","Spinach","Bean","Air purifier","Air conditioner","Alarm clock","Backup charger","Bread maker","Banknote counter","Blender","Bluetooth speaker","Bulb","Calculator","Car toy","Ceiling fan","Chandelier","Clock","Clothes dryer","Coffee maker","Computer","Copier","Curling iron","Digital camera","Dishwasher","Doorbell camera","Drill","Dvd player","Earphones","Electric frying pan","Electric grill","Electric guitar","Electric pencil sharpener","Electric razor","Electric stove","Exhaust fan","External hard drive","Fan","Facial cleansing machine","Fax","Fish tank","Floor lamp","Game controller","Garage","Grandfather clock","Hair dryer","Headset","Inkjet printer","iPod","Iron","Juicer","Kettle","Kitchen scale","Hair straightening machine","Laser printer","Lawn mower","Lift","Meat grinder","Microphone","Microwave","Mixer","Monitor","Mosquito racket","Mouse","Mp3 player","Oil-free fryer","Piano","Oven","Plotter","Pressure cooker","Printer","Projector","Radiator","Radio","Reading lamp","Refrigerator","Remote control","Rice cooker","Safe","Robotic vacuum cleaner","Sandwich maker","Scale","Scanner","Sewing machine","Smart television","Smartphone","Speakers","Tablet","Television","Timer","Toaster","Torch","USB drive","Vacuum cleaner","Walkie-talkie","Washing machine","Watch","Water pumps","Water purifier","Wall fan","Water heater","Webcam","Wifi modem","Stapler","Eraser","Push-pin","Paper clip","Rubber stamp","Highlighter","Fountain pen","Pencil","Marker","Ballpoint","Bulldog clip","Tape dispenser","Pencil sharpener","Label","Calculator","Glue","Scissors","Sticky notes","Paper","Notebook","Envelope","Clipboard","Monitor","Computer","Keyboard","Folder","Fax","Filing cabinet","Telephone","Swivel chair","Desk"
    ]
    %{name: Enum.random(products), features: %{price: Enum.random(100..1000), quantity: Enum.random(1..10)}}
  end

  @spec genFakeEmail :: <<_::64, _::_*8>>
  defp genFakeEmail() do
    adjectives =[
      "adorable", "adventurous", "aggressive", "alert", "attractive", "average", "beautiful", "blue-eyed ", "bloody", "blushing", "bright", "clean", "clear", "cloudy", "colorful", "crowded", "cute", "dark", "drab", "distinct", "dull", "elegant", "excited", "fancy", "filthy", "glamorous", "gleaming", "gorgeous", "graceful", "grotesque", "handsome", "homely", "light", "long", "magnificent", "misty", "motionless", "muddy", "old-fashioned", "plain", "poised", "precious", "quaint", "shiny", "smoggy", "sparkling", "spotless", "stormy", "strange", "ugly", "ugliest", "unsightly", "unusual", "wide-eyed ", "alive", "annoying", "bad", "better", "beautiful", "brainy", "breakable", "busy", "careful", "cautious", "clever", "clumsy", "concerned", "crazy", "curious", "dead", "different", "difficult", "doubtful", "easy", "expensive", "famous", "fragile", "frail", "gifted", "helpful", "helpless", "horrible", "important", "impossible", "inexpensive", "innocent", "inquisitive", "modern", "mushy", "odd", "open", "outstanding", "poor", "powerful", "prickly", "puzzled", "real", "rich", "shy", "sleepy", "stupid", "super", "talented", "tame", "tender", "tough", "uninterested", "vast", "wandering", "wild", "wrong", "agreeable", "amused", "brave", "calm", "charming", "cheerful", "comfortable", "cooperative", "courageous", "delightful", "determined", "eager", "elated", "enchanting", "encouraging", "energetic", "enthusiastic", "excited", "exuberant", "fair", "faithful", "fantastic", "fine", "friendly", "funny", "gentle", "glorious", "good", "happy", "healthy", "helpful", "hilarious", "jolly", "joyous", "kind", "lively", "lovely", "lucky", "nice", "obedient", "perfect", "pleasant", "proud", "relieved", "silly", "smiling", "splendid", "successful", "thankful", "thoughtful", "victorious", "vivacious", "witty", "wonderful", "zealous", "zany"
    ]

    animals =[
    "aardvark", "albatross", "alligator", "alpaca", "ant", "anteater", "antelope", "ape", "armadillo", "herd", "baboon", "badger", "barracuda", "bat", "bear", "beaver", "bee", "bison", "boar", "galago", "butterfly", "camel", "caribou", "cat", "caterpillar", "cattle", "chamois", "cheetah", "chicken", "chimpanzee", "chinchilla", "chough", "clam", "cobra", "cockroach", "cod", "cormorant", "coyote", "crab", "herd", "crocodile", "crow", "curlew", "deer", "dinosaur", "dog", "dolphin", "donkey", "dotterel", "dove", "dragonfly", "duck", "dugong", "dunlin", "eagle", "echidna", "eel", "elephant", "elk", "emu", "falcon", "ferret", "finch", "fish", "flamingo", "fly", "fox", "frog", "gaur", "gazelle", "gerbil", "giraffe", "gnat", "goat", "goose", "goldfish", "gorilla", "goshawk", "grasshopper", "grouse", "guanaco", "poultry", "herd", "gull", "hamster", "hare", "hawk", "hedgehog", "heron", "herring", "hippopotamus", "hornet", "horse", "human", "hummingbird", "hyena", "jackal", "jaguar", "jay", "jellyfish", "kangaroo", "koala", "kouprey", "kudu", "lapwing", "lark", "lemur", "leopard", "lion", "llama", "lobster", "locust", "loris", "louse", "lyrebird", "magpie", "mallard", "manatee", "marten", "meerkat", "mink", "monkey", "moose", "mouse", "mosquito", "mule", "narwhal", "newt", "nightingale", "octopus", "okapi", "opossum", "oryx", "ostrich", "otter", "owl", "ox", "oyster", "parrot", "partridge", "peafowl", "pelican", "penguin", "pheasant", "pig", "pigeon", "pony", "porcupine", "porpoise", "quail", "quelea", "rabbit", "raccoon", "rat", "raven", "herd", "reindeer", "rhinoceros", "ruff", "salamander", "salmon", "sandpiper", "sardine", "scorpion", "herd", "seahorse", "shark", "sheep", "shrew", "shrimp", "skunk", "snail", "snake", "spider", "squid", "squirrel", "starling", "stingray", "stinkbug", "stork", "swallow", "swan", "tapir", "tarsier", "termite", "tiger", "toad", "trout", "poultry", "turtle", "vulture", "wallaby", "walrus", "wasp", "carabeef", "weasel", "whale", "wolf", "wolverine", "wombat", "woodcock", "woodpecker", "worm", "wren", "yak", "zebra"
    ]
    Enum.random(adjectives) <> "-" <> Enum.random(animals) <> "@mail.com"
  end
end
