#!mainFile "main.opy"

settings {
    "main": {
        "description": "We're all soldiers now! When a player from your team dies, everyone from your team gets a new hero (everyone is the same). Ultimate charge is preserved, ultimate ability is not interrupted",
        "modeName": "Cohesion V2a"
    },
    "lobby": {
        "spectatorSlots": 12,
        "team1Slots": 6,
        "team2Slots": 6
    },
    "gamemodes": {
        "assault": {
            "enabled": false,
            "enableCompetitiveRules": true
        },
        "control": {
            "enabled": false,
            "enableCompetitiveRules": true
        },
        "ffa": {
            "enabled": false,
            "gameLengthInMn": 15,
            "scoreToWin": 50,
            "enableSelfInitiatedRespawn": false
        },
        "escort": {
            "disabledMaps": [
                "circuitRoyal",
                "shambaliMonastery"
            ],
            "enableCompetitiveRules": true
        },
        "hybrid": {
            "disabledMaps": [
                "eichenwalde",
                "hollywood",
                "kingsRow",
                "midtown",
                "paraiso"
            ],
            "enableCompetitiveRules": true
        },
        "tdm": {
            "enabled": false,
            "gameLengthInMn": 15
        },
        "general": {
            "enableHeroSwitching": false,
            "gamemodeStartTrigger": "immediately",
            "heroLimit": "off",
            "enableRandomHeroes": true,
            "respawnTime%": 10
        }
    },
    "heroes": {
        "allTeams": {
            "disabledHeroes": [
                "hanzo",
                "illari",
                "junkerQueen",
                "kiriko",
                "lifeweaver",
                "mauga",
                "ramattra",
                "sojourn",
                "torbjorn",
                "tracer",
                "hammond"
            ]
        }
    }
}
