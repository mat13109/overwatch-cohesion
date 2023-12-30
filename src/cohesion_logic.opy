#!mainFile "main.opy"

#Global variables

globalvar HeroTeam1 0
globalvar HeroTeam2 3
globalvar CountForEndRound 4


#Player variables

playervar PreviousUltCharge 0
playervar Count 3
playervar IsSpecialUlt 4


rule "Switch Player Team 1":
    @Event playerDied
    @Team 1
    
    eventPlayer.teleport(getSpawnPoints(Team.1))
    HeroTeam1 = random.choice(getAllHeroes())
    if eventPlayer.getCurrentHero() == HeroTeam1:
        HeroTeam1 = random.choice(getAllHeroes())
    eventPlayer.Count = 0
    while eventPlayer.Count < len(getPlayers(Team.1)):
        if getPlayers(Team.1)[eventPlayer.Count] != eventPlayer:
            if getPlayers(Team.1)[eventPlayer.Count].isAlive() == true:
                if getPlayers(Team.1)[eventPlayer.Count].isUsingUltimate() == false:
                    if getPlayers(Team.1)[eventPlayer.Count].IsSpecialUlt != true:
                        getPlayers(Team.1)[eventPlayer.Count].PreviousUltCharge = getPlayers(Team.1)[eventPlayer.Count].getUltCharge()
                        getPlayers(Team.1)[eventPlayer.Count].startForcingHero(HeroTeam1)
                        wait(0.25)
                        getPlayers(Team.1)[eventPlayer.Count].setUltCharge(getPlayers(Team.1)[eventPlayer.Count].PreviousUltCharge)
        eventPlayer.Count = eventPlayer.Count + 1
    eventPlayer.Count = 0
    kill(eventPlayer, attacker)
    wait(10.5)
    eventPlayer.PreviousUltCharge = eventPlayer.getUltCharge()
    eventPlayer.startForcingHero(HeroTeam1)
    wait(0.25)
    eventPlayer.setUltCharge(eventPlayer.PreviousUltCharge)
    bigMessage(getPlayers(Team.1), "{0}".format(HeroTeam1))


rule "Switch Player Team 2":
    @Event playerDied
    @Team 2
    
    eventPlayer.teleport(getSpawnPoints(Team.2))
    HeroTeam2 = random.choice(getAllHeroes())
    if eventPlayer.getCurrentHero() == HeroTeam2:
        HeroTeam2 = random.choice(getAllHeroes())
    eventPlayer.Count = 0
    while eventPlayer.Count < len(getPlayers(Team.2)):
        if getPlayers(Team.2)[eventPlayer.Count] != eventPlayer:
            if getPlayers(Team.2)[eventPlayer.Count].isAlive() == true:
                if getPlayers(Team.2)[eventPlayer.Count].isUsingUltimate() == false:
                    if getPlayers(Team.2)[eventPlayer.Count].IsSpecialUlt != true:
                        getPlayers(Team.2)[eventPlayer.Count].PreviousUltCharge = getPlayers(Team.2)[eventPlayer.Count].getUltCharge()
                        getPlayers(Team.2)[eventPlayer.Count].startForcingHero(HeroTeam2)
                        wait(0.25)
                        getPlayers(Team.2)[eventPlayer.Count].setUltCharge(getPlayers(Team.2)[eventPlayer.Count].PreviousUltCharge)
        eventPlayer.Count = eventPlayer.Count + 1
    eventPlayer.Count = 0
    kill(eventPlayer, attacker)
    wait(10.5)
    eventPlayer.PreviousUltCharge = eventPlayer.getUltCharge()
    eventPlayer.startForcingHero(HeroTeam2)
    wait(0.25)
    eventPlayer.setUltCharge(eventPlayer.PreviousUltCharge)
    bigMessage(getPlayers(Team.1), "{0}".format(HeroTeam2))


rule "End of ult team 1":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isUsingUltimate() == false
    #@Condition eventPlayer.isAlive() == true
    #@Condition (not eventPlayer.isUsingUltimate() and eventPlayer.isAlive()) == true
    
    if eventPlayer.getCurrentHero() == Hero.HANZO:
        eventPlayer.IsSpecialUlt = true
        wait(10)
        eventPlayer.IsSpecialUlt = false
    if eventPlayer.getCurrentHero() == Hero.HAMMOND:
        eventPlayer.IsSpecialUlt = true
        wait(20)
        eventPlayer.IsSpecialUlt = false
    if eventPlayer.getCurrentHero() == Hero.TORBJORN:
        eventPlayer.IsSpecialUlt = true
        wait(10)
        eventPlayer.IsSpecialUlt = false
    if eventPlayer.getCurrentHero() == Hero.TRACER:
        eventPlayer.IsSpecialUlt = true
        wait(1.5)
        eventPlayer.IsSpecialUlt = false
    wait(0.25)
    if eventPlayer.isAlive() == true:
        if eventPlayer.getCurrentHero() != HeroTeam1:
            eventPlayer.startForcingHero(HeroTeam1)
        #smallMessage(getAllPlayers(), "end of ult")


rule "End of ult team 2":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isUsingUltimate() == false
    #@Condition eventPlayer.isAlive() == true
    #@Condition (not eventPlayer.isUsingUltimate() and eventPlayer.isAlive()) == true
    
    if eventPlayer.getCurrentHero() == Hero.HANZO:
        eventPlayer.IsSpecialUlt = true
        wait(10)
        eventPlayer.IsSpecialUlt = false
    if eventPlayer.getCurrentHero() == Hero.HAMMOND:
        eventPlayer.IsSpecialUlt = true
        wait(20)
        eventPlayer.IsSpecialUlt = false
    if eventPlayer.getCurrentHero() == Hero.TORBJORN:
        eventPlayer.IsSpecialUlt = true
        wait(10)
        eventPlayer.IsSpecialUlt = false
    if eventPlayer.getCurrentHero() == Hero.TRACER:
        eventPlayer.IsSpecialUlt = true
        wait(1.5)
        eventPlayer.IsSpecialUlt = false
    wait(0.25)
    if eventPlayer.isAlive() == true:
        if eventPlayer.getCurrentHero() != HeroTeam2:
            eventPlayer.startForcingHero(HeroTeam2)
        #smallMessage(getAllPlayers(), "end of ult")


rule "Player joined":
    @Event playerJoined
    
    if eventPlayer.getTeam() == Team.1:
        eventPlayer.startForcingHero(HeroTeam1)
    elif eventPlayer.getTeam() == Team.2:
        eventPlayer.startForcingHero(HeroTeam2)


rule "End of round":
    @Condition isGameInProgress() == false
    
    CountForEndRound = 0
    while CountForEndRound < len(getAllPlayers()):
        getAllPlayers()[CountForEndRound].startForcingHero(Hero.SOLDIER)
        CountForEndRound = CountForEndRound + 1
    HeroTeam1 = Hero.SOLDIER
    HeroTeam2 = Hero.SOLDIER
