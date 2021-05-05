from fuzzywuzzy import fuzz
from fuzzywuzzy import process

match = "desktop thread"
#test = "Desktop Shread last one hit bnump limit"
test = "There are people with egos so fragile that learning is an extremely painful experience because it confonts them with how little they now about something."
print(fuzz.partial_ratio(match, test))
print(fuzz.partial_ratio(test, match))

