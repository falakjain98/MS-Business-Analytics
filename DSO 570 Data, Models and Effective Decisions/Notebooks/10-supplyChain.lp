\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  20 x[1,A] + 18 x[1,B] + 21 x[1,C] + 8 x[1,D] + 8 x[2,A] + 23 x[2,B]
   + 24 x[2,C] + 8 x[2,D] + 25 x[3,A] + 8 x[3,B] + 8 x[3,C] + 19 x[3,D]
Subject To
 Capacity_1: x[1,A] + x[1,B] + x[1,C] + x[1,D] <= 40
 Capacity_2: x[2,A] + x[2,B] + x[2,C] + x[2,D] <= 40
 Capacity_3: x[3,A] + x[3,B] + x[3,C] + x[3,D] <= 40
 Demand_A: x[1,A] + x[2,A] + x[3,A] >= 30
 Demand_B: x[1,B] + x[2,B] + x[3,B] >= 50
 Demand_C: x[1,C] + x[2,C] + x[3,C] >= 10
 Demand_D: x[1,D] + x[2,D] + x[3,D] >= 20
Bounds
End
