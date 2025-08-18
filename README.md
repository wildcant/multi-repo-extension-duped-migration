1. Initialized the project: `mix igniter.new data_pipeline_cron_poc --with phx.new --install ash,ash_phoenix --install ash_postgres,ash_oban --install oban_web --yes`
2. Added new oban repo - copy pasted default repo.
3. migrated successfully: `mix ecto.create && mix ash.codegen --dev && mix ash.migrate`
4. added ash money: `mix igniter.install ash_money`
5. The step above generated the same migration to add ash money twice so running `mix ash.migrate` fails.

```shell
17:25:15.639 [info] execute "CREATE TYPE public.money_with_currency AS (currency_code varchar, amount numeric);"
** (Postgrex.Error) ERROR 42710 (duplicate_object) type "money_with_currency" already exists
    (ecto_sql 3.13.2) lib/ecto/adapters/sql.ex:1098: Ecto.Adapters.SQL.raise_sql_call_error/1
    (elixir 1.18.4) lib/enum.ex:1714: Enum."-map/2-lists^map/1-1-"/2
    (ecto_sql 3.13.2) lib/ecto/adapters/sql.ex:1219: Ecto.Adapters.SQL.execute_ddl/4
    (ecto_sql 3.13.2) lib/ecto/migration/runner.ex:348: Ecto.Migration.Runner.log_and_execute_ddl/3
    (elixir 1.18.4) lib/enum.ex:1714: Enum."-map/2-lists^map/1-1-"/2
    (ecto_sql 3.13.2) lib/ecto/migration/runner.ex:311: Ecto.Migration.Runner.perform_operation/3
    (stdlib 7.0) timer.erl:599: :timer.tc/2
    (ecto_sql 3.13.2) lib/ecto/migration/runner.ex:25: Ecto.Migration.Runner.run/8
```


doing it while we speak - I'm wondering if it's just an issue with installed extensions as it seems it doesn't generate duplicated migration for resources