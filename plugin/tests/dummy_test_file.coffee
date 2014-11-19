

module "Module 1"
test "test example1a", ->
  equal 5, 5, "The values are equal"
  return

test "test example2a", ->
  equal 5, 5, "The values are equal"
  return

module "Module 2"
test "test example1b", ->
  equal 5, 5, "The values are equal"
  return

test "test example2b", ->
  equal 5, 5, "The values are equal"
  return


