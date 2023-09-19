local metals_config = require("metals").bare_config()

metals_config.settings = {
  showImplicitArguments = true,
  -- excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
