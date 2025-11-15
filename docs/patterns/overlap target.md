# Overview
Avoid casting non-stacking buffs if one is already active in target area.
- e.g. radiation bomb, subspace rupture


- I don't know how to efficiently achieve this, as these abilities spawn an invisible buff marker, that doesn't seem to be accessible by filters
- current compromise is to use [aoe targeting](aoe%20targeting.md) approach - don't cast if there are less than X unaffected targets

- alternatively:  cast spell if condition met AND NOT same spell affecting units around target
  - likely will have bad performance (high computation resource usage) , as this needs to search for targets, not casters, as in [overlap self](overlap%20self.md)

# Example
cast spell if condition met AND NOT same spell affecting units around target


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
              "unit_type": "target"
            },
            "target_filter_id": "XXXXXX_auto_cast_overlap_target_filter",
            "radius_value": "XXXXXX_radius",
            "target_count_value": "XXXXXX_autocast_overlap_targets"
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