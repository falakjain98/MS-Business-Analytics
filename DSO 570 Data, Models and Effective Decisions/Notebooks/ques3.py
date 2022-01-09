#offers=[[5,'Intel',3],[8,'Amazon',7],[12,'Disney',3],[15,'Google',2],[15,'Facebook',2]]
#utility={'Intel':5,'Amazon':8,'Google':8,'Facebook':8}
#offers=[[5,'Intel',3],[9,'Amazon',7],[12,'Disney',3],[15,'Google',2],[15,'Facebook',2]]
#utility={'Intel':5,'Amazon':9.5,'Google':10,'Facebook':10}
#offers=[[5,'Intel',3],[8,'Amazon',7],[12,'Disney',3],[15,'Google',1],[15,'Facebook',2]]
#utility={'Amazon':8,'Google':8,'Facebook':8}
#offers=[[5,'Intel',3],[8,'Amazon',7],[12,'Disney',3],[13,'Google',2],[16,'Facebook',2]]
#utility={'Amazon':8,'Google':8,'Facebook':8}
offers=[[8,'Amazon',7],[12,'Disney',3],[13,'Google',2],[17,'Facebook',2]]
utility={'Apple':100, 'Intel': 80}

def job_decision(offers, utility):
    num_offers = len(offers)
    expiryLis = {}
    bestoffer = ""
    starting = {}
    for i in range(num_offers):
        expiry = -1
        if(offers[i][1] in utility.keys()):
            expiry = offers[i][0] + offers[i][2]
        expiryLis[offers[i][1]] = expiry
        starting[ offers[i][1] ] = offers[i][0]
    ind = 0
    for i in range(num_offers):
        if(offers[i][1] in utility.keys()):
            if( bestoffer == ""):
                bestoffer = offers[i][1]
                ind = i
                break
    #print(bestoffer)

    for i in range(ind+1, num_offers):
        if( offers[i][1] in utility.keys()):
            if( offers[i][0] > expiryLis[bestoffer]):
                break
            else:
                if(utility[offers[i][1]] > utility[bestoffer]):
                    bestoffer = offers[i][1]
                elif(utility[offers[i][1]] == utility[bestoffer]):
                        if (expiryLis[offers[i][1]] > expiryLis[bestoffer] ):
                            bestoffer = offers[i][1]
                            
    print(bestoffer)

job_decision(offers, utility)
