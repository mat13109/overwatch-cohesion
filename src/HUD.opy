#!mainFile "main.opy"

rule "HUD":
    hudText(getAllPlayers(), null, "WAN2k22", "We're all soldiers now!", HudPosition.TOP, 0, Color.WHITE, Color.ORANGE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    if HeroTeam1 == null:
        HeroTeam1 = Hero.SOLDIER
    hudHeader(getAllPlayers(), "{0}".format(HeroTeam1), HudPosition.LEFT, 0, Color.TEAM_1, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    if HeroTeam2 == null:
        HeroTeam2 = Hero.SOLDIER
    hudHeader(getAllPlayers(), "{0}".format(HeroTeam2), HudPosition.RIGHT, 0, Color.TEAM_2, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
