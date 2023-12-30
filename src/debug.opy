#!mainFile "main.opy"

rule "DEBUG Crouch":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.CROUCH) == true
    @Condition eventPlayer.isAlive() == true
    
    kill(eventPlayer, null)


rule "DEBUG Interract":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    HeroTeam1 = Hero.SYMMETRA
    HeroTeam2 = Hero.TORBJORN
