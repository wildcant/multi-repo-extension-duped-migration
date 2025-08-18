1. Initialized the project: `mix igniter.new data_pipeline_cron_poc --with phx.new --install ash,ash_phoenix --install ash_postgres,ash_oban --install oban_web --yes`
2. Added new oban repo.
3. migrated successfully: `mix ecto.create && mix ash.codegen --dev && mix ash.migrate`
4. added ash money: `mix igniter.install ash_money`
5. The step above generated the same migration to add ash money twice so running `mix ash.migrate` fails.