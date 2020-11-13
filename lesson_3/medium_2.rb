#3
My string looks like this now: pumpkins #as assignment don't mutate the caller
My array looks like this now: ["pumpkins", "rutabaga"] #<< mutated the caller

#4
My string looks like this now: "pumpkinsrutabaga"
My array looks like this now: ["pumpkins"]

#5
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

#6
def color_valid(color)
  color == "blue" || color == "green"
end