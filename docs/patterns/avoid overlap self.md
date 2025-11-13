- cast spell if condition met AND NOT same spell in effect around caster
- e.g. plasma nova, flak burst, shield blessing...

ability.auto_cast:
```json
{
  "auto_cast": {
    "enabled_by_default_behavior": "always",
    "caster_constraint": {
      "constraint_type": "composite_and",
      "constraints": [
        {
          //default condition
        },
        {
          "constraint_type": "composite_not",
          "constraint": {
            "constraint_type": "has_valid_targets_in_radius",
            "radius_origin_unit": {
              "unit_type": "current_spawner"
            },
            "target_filter_id": "shield_blessing_auto_cast_prevention_target_filter",
            "radius_value": "shield_blessing_autocast_prevention_radius",
            "target_count_value": "shield_blessing_autocast_prevention_targets"
          }
        }
      ]
    }
  }
}
```

action_data_source.target_filters:
```json
{
  "target_filter_id": "shield_blessing_auto_cast_prevention_target_filter",
  "target_filter": {
    "unit_definitions": [
      "advent_carrier_capital_ship"
    ],
    "ownerships": [
      "friendly"
    ],
    "constraints": [
      {
        "constraint_type": "has_buff",
        "buff": "advent_carrier_capital_ship_shield_blessing_on_spawner",
        "include_pending_buffs": true
      }
    ]
  }
}

```
