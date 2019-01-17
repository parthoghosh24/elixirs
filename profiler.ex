defmodule Profiler do
  def name(name) do
    IO.puts "Name is #{name}"
  end

  def age(age) do
    IO.puts "Age is #{age}"
  end

  def lucky do
     lucky?(Enum.random(0..10))
  end

  def do_lucky(name) do
    f = &"#{name} your luck validation is #{&1}"
    f.(lucky())
  end

  def your_age(name, age \\ 3000) do
    "#{name}, your age is "<>"#{age}"
  end

  def agl(age \\ -1 , gender \\ nil, loc \\ "")

  def agl(age, gender, _loc) when is_nil(gender) do
    "#{age}"
  end

  def agl(age, gender, loc) when is_nil(loc) do
    "#{age}, #{gender}"
  end

  def agl(age, gender, loc) do
    "#{age}, "<>"#{gender}, "<>"#{loc}"
  end

  defp lucky?(number) do
    number == 5
  end
end
