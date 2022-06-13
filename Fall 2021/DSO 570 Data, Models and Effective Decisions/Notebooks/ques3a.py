def job_decision(offers, utility):
    num_offers = len(offers)
    expiryLis = {}
    bestoffer = ""
    ind = 0
    for i in range(num_offers):
        expiry = -1
        if(offers[i][1] in utility.keys()):
            expiry = offers[i][0] + offers[i][2]
            if( bestoffer == ""):
                bestoffer = offers[i][1]
                ind = i
        expiryLis[offers[i][1]] = expiry

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