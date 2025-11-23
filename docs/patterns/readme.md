# 1 Overview
General structure / know-how for modification of autocast logic.

## 1.1 Contents
- [1 Overview](#1-overview)
  - [1.1 Contents](#11-contents)
  - [1.2 References](#12-references)
- [2 Ability](#2-ability)
  - [2.1 Caster constraint](#21-caster-constraint)
  - [2.2 Target definitions](#22-target-definitions)
- [3 Action data source](#3-action-data-source)
  - [3.1 Target filters](#31-target-filters)
  - [3.2 Action values](#32-action-values)

## 1.2 References
- [ability file schema](https://github.com/StardockCorp/sins2modtools/blob/main/json_schemas/ability-schema.json)
- [action data source schema](https://github.com/StardockCorp/sins2modtools/blob/main/json_schemas/action-data-source-schema.json)



---

# 2 Ability

## 2.1 Caster constraint
`ability.auto_cast.caster_constraint`
Defines condition upon the caster which must be met in order for autocast to occur.
Can have multiple conditions composed using AND/OR/NOT.

### 2.1.1 Use case: self targeted abilities / auras

Example - cast flak burst if you have at least X valid targets in radius
```json
{
  "auto_cast": {
    "enabled_by_default_behavior": "always",
    "caster_constraint": {
      "constraint_type": "has_valid_targets_in_radius",
      "radius_origin_unit": {
        "unit_type": "current_spawner"
      },
      "target_filter_id": "flak_burst_auto_cast_target",
      "radius_value": "auto_cast_radius",
      "target_count_value": "auto_cast_target_count"
    }
  }
}
```

### 2.1.2 Use case : targeted abilities in conjunction with target definitions
Use if there is a condition that applies regardless of target.

Example - cast targeted ability only if you have at least 10% missing armor
```json
{
  "auto_cast": {
    "enabled_by_default_behavior": "always",
    "caster_constraint": {
      "constraint_type": "unit_passes_unit_constraint",
      "unit": {
        "unit_type": "current_spawner"
      },
      "unit_constraint": {
        "constraint_type": "has_missing_armor",
        "percentage_missing_threshold": 0.1
      }
    },
    "target_definitions": []
  }
}
```


---

## 2.2 Target definitions
`ability.auto_cast.target_definitions`
Used for abilities that have a target (e.g. animosity, missile barrage, subspace rupture).
Can have multiple definitions, which are evaluated in order from top to bottom (used for target prioritization).

Target filters must be defined in `action_data_source` file.

### 2.2.1 Use case: Target prioritization

Example - prioritize titans, capital ships, cruisers in that order
```json
{
  "auto_cast": {
    "enabled_by_default_behavior": "always",
    "target_definitions": [
      {
        "target_filter": "XXXXXX_titans_filter"
      },
      {
        "target_filter": "XXXXXX_caps_filter"
      },
      {
        "target_filter": "XXXXXX_cruisers_filter"
      }
    ]
  }
}
```

### 2.2.2 Use case: Target constraints
Additional constraints can be defined directly at target definition.

Used for conditions on the target that cannot be defined by a filter e.g. checking a condition for units around it or value comparison.

see [filter constraints](#311-filter-constraints)

#### Example - cast radiation bomb only if it has at least X valid targets (embedded - not preferred)
```json
{
  "auto_cast": {
    "enabled_by_default_behavior": "always",
    "target_definitions": [
      {
        "target_filter": "radiation_bomb_auto_cast_target_filter",
        "target_constraint": {
          "constraint_type": "has_valid_targets_in_radius",
          "radius_origin_unit": {
            "unit_type": "target"
          },
          "radius_value": "radiation_bomb_radius_value",
          "target_filter_id": "radiation_bomb_auto_cast_target_filter",
          "target_count_value": "radiation_bomb_auto_cast_minimum_target_count"
        }
      }]
  }
}
```

#### Example - check if target has antimatter over certain threshold

```json
{
    "auto_cast": {
        "enabled_by_default_behavior": "always",
        "target_definitions": [
            {
                "target_filter": "nullify_auto_cast_target_filter",
                "target_constraint": {
                    "constraint_type": "value_comparison",
                    "comparison_type": "greater_than_equal_to",
                    "value_a": "uniforms_target_current_antimatter",
                    "value_b": "nullify_autocast_min_target_antimatter_value"
                }
            }
        ]
    }
}

```


---

# 3 Action data source
Contains data and filters used by ability definition.

## 3.1 Target filters
`action_data_source.target_filters`





### 3.1.1 Filter constraints
`action_data_source.target_filters.filter.constraints`

#### Example - cast radiation bomb only if it has at least X valid targets (part of filter definition)

ability.auto_cast:
```json
{
  "auto_cast": {
    "enabled_by_default_behavior": "always",
    "target_definitions": [
      {
        "target_filter": "radiation_bomb_auto_cast_target_filter"
      }
    ]
  }
}
```

action_data_source.target_filters:
```json
{
  "target_filters": [
    {
      "target_filter_id": "radiation_bomb_auto_cast_target_filter",
      "target_filter": {
        "unit_types": [ 
          "capital_ship",
          "cruiser",
          "frigate",
          "super_capital_ship",
          "titan"
        ],
        "ownerships": [
          "enemy"
        ],
        "constraints": [
          {
            "constraint_type": "has_valid_targets_in_radius",
            "radius_origin_unit": {
              "unit_type": "target"
            },
            "radius_value": "radiation_bomb_radius_value",
            "target_filter_id": "radiation_bomb_auto_cast_target_filter",
            "target_count_value": "radiation_bomb_auto_cast_minimum_target_count"
          }
        ]
      }
    }
  ]
}

```


---

## 3.2 Action values
`action_data_source.action_values`

Contains various constants for the ability. If ability has multiple levels, values must be defined for each level.

Example - subspace rupture target count (3 values for 3 ability levels)
```json
{
  "action_values": [
    {
      "action_value_id": "subspace_rupture_auto_cast_minimum_target_count",
      "action_value": {
        "values": [5, 5, 5]
      }
    }
  ]
}


```