IEx.configure(
  history_size: 100,
  inspect: [
    pretty: true,
    width: 80,
    limit: 5_000
  ],
  colors: [
    eval_result: [:green, :bright],
    eval_error: [:red, :bright]
  ],
  default_prompt:
    "#{IO.ANSI.color(5, 1, 0)}λ #{IO.ANSI.reset()}" <>
      "#{IO.ANSI.green()}(#{IO.ANSI.green()}%counter#{IO.ANSI.reset()}" <>
      "#{IO.ANSI.green()})#{IO.ANSI.color(5, 1, 0)}>",
  alive_prompt:
    "#{IO.ANSI.green()}λ#{IO.ANSI.reset()}" <>
      "(#{IO.ANSI.cyan()}%node#{IO.ANSI.reset()}) " <>
      "(#{IO.ANSI.cyan()}%counter#{IO.ANSI.reset()}) >"
)

