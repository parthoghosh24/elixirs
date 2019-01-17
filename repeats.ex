defmodule Repeats do
  def print_multi(msg, n) when n <=1 do
    IO.puts msg
  end

  def print_multi(msg, n) do
    IO.puts msg
    print_multi(msg, n-1)
  end

  # Example of Reduce
  def sumup_list([],acc) do
    acc
  end

  def sumup_list([head | tail], acc) do
    sumup_list(tail, head + acc)
  end

  # Example of Map
  def double_up([head | tail]) do
    [head * 2 | double_up(tail)]
  end
  def double_up([]) do
    []
  end

  def key_val_mul(cmap) do
    Enum.map(cmap, fn {k,v} -> k * v end)
  end

  def range_test do
    IO.puts Enum.reduce(1..5,0,&+/2)
    IO.puts Enum.map(1..5, fn x -> x * 2 end)
  end

  def eagerness do
    even? = &(rem(&1,2) == 0)
    Enum.filter(1..10,even?)
  end

  def eager_pipeline do
    # Enums do eager operations
    even? = &(rem(&1,2) == 0)
    total_sum = 1..100_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(even?) |> Enum.sum
    total_sum
  end

  def lazy_pipeline do
    # Streams do lazy operations
    even? = &(rem(&1,2) == 0)
    # Below Stream.map returning a Stream only
    #
    # Instead of generating intermediate lists, streams build a series of
    # computations that are invoked only when we pass the underlying stream
    # to the Enum module. Streams are useful when working with
    # large, possibly infinite, collections.
    #
    total_sum = 1..100_000 |> Stream.map(&(&1 * 3)) |> Stream.filter(even?) |> Enum.sum
    total_sum
  end

  def cycling do
    cycled = Stream.cycle([2,4,6])
    Enum.take(cycled, 20)
  end

  def filer do
    stream = File.stream!("profiler.ex")
    Enum.take(stream, 10)
  end

end
