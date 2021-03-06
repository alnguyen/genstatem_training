defmodule Training.Turnstile do
  use GenStateMachine, callback_mode: :state_functions

  # This allows our graphviz directed graph to be rendered
  # as an image in the documentation
  import Training.Util.Graphviz

  @fsm_diagram """
  digraph {
    rankdir=LR
    node [shape=doublecircle]
    locked
    node [shape=circle]
    unlocked

    unlocked -> locked [label="push"]
    locked -> unlocked [label="coin"]
    locked -> locked [label="push"]
    unlocked -> unlocked [label="coin"]
  }
  """

  @moduledoc """
  Represents a turnstile as a state machine

  As a diagram, the state machine is
  #{image(@fsm_diagram, "jpeg")}
  """

  @doc """
  Start a turnstile

  Ignores any arguments passed in
  """
  def start_link(args \\ []) do
    GenStateMachine.start_link(__MODULE__, args)
  end

  @doc """
  Initializes a turnstile into the `:locked` state with a people-counter of `0`
  """
  @spec init(any()) :: :gen_statem.init_result(GenStateMachine.state())
  def init(_) do
    # TODO Start in a locked state
  end

  @doc """
  Called while in the `:unlocked` state
  """
  @spec unlocked(
          GenStateMachine.event_type(),
          GenStateMachine.event_content(),
          GenStateMachine.data()
        ) :: :gen_statem.event_handler_result(GenStateMachine.state())
  def unlocked(:cast, :push, data) do
    # TODO move to a locked state
  end

  def unlocked(_, _, _) do
    # TODO stay in our current state
  end

  @doc """
  Called while in the `:locked` state
  """
  @spec locked(
          GenStateMachine.event_type(),
          GenStateMachine.event_content(),
          GenStateMachine.data()
        ) :: :gen_statem.event_handler_result(GenStateMachine.state())
  def locked(:cast, :coin, data) do
    # TODO move to an unlocked state
  end

  def locked(_, _, _) do
    # TODO stay in our current state
  end
end
