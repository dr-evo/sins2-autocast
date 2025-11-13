ability.auto_cast:

```json
{
  "auto_cast": {
    "enabled_by_default_behavior": "always",
    "caster_constraint": {
      // default condition
    },
    "target_definitions": [
      {
        "target_filter": "priority1"
      },
      {
        "target_filter": "priority2"
      },
      {
        "target_filter": "priority3"
      },
      {
        "target_filter": "..."
      }
    ]
  }
}
```

action_data_source.target_filters:
```json

{
  "target_filter_id": "priority1",
  "target_filter": {
    "unit_types": [
      "capital_ship",
      "super_capital_ship",
      "titan"
    ],
    "ownerships": [
      "enemy"
    ]
  }
}
```