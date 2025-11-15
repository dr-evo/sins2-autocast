# Overview
Target an AOE only if it has at least X valid targets.
e.g. subspace rupture, radiation bomb

combine with targeting priority or overlap if necessary


# Example
add 'target_constraint' = 'has_valid_targets_in_radius'
with 'target_count_value' = desired minimum target count

ability.auto_cast
```json
{
  "auto_cast": {
    "enabled_by_default_behavior": "always",
    "target_definitions": [
      {
        "target_filter": "default_filter",
        "target_constraint": {
          "constraint_type": "has_valid_targets_in_radius",
          "radius_origin_unit": {
            "unit_type": "target"
          },
          "radius_value": "ability_radius",
          "target_filter_id": "default_filter",
          "target_count_value": "autocast_minimum_target_count"
        }
      }
    ]
  }
}
```

action_data_source.action_values
```json
{
  "action_value_id": "autocast_minimum_target_count",
  "action_value": {
    "values": [5]
  }
}
```