defmodule Shop.App do
  use Commanded.Application,
    otp_app: :shop,
    event_store: [
      adapter: Commanded.EventStore.Adapters.EventStore,
      event_store: Shop.EventStore
    ]

  router(Shop.Router)
end
