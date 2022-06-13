\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  x[0,3] + x[1,3] + x[2,3] + x[3,3]
Subject To
 in_=_out: - x[0,1] + x[1,0] + x[1,2] + x[1,3] - x[2,1] - x[3,1] = 0
 in_=_out: - x[0,2] - x[1,2] + x[2,0] + x[2,1] + x[2,3] - x[3,2] = 0
 No_Outflow_from_destination: x[3,0] = 0
 No_Outflow_from_destination: x[3,1] = 0
 No_Outflow_from_destination: x[3,2] = 0
 No_Outflow_from_destination: x[3,3] = 0
 Truck_Capacity: x[0,0] <= 0
 Truck_Capacity: x[0,1] <= 8
 Truck_Capacity: x[0,2] <= 5
 Truck_Capacity: x[0,3] <= 0
 Truck_Capacity: x[1,0] <= 8
 Truck_Capacity: x[1,1] <= 0
 Truck_Capacity: x[1,2] <= 2
 Truck_Capacity: x[1,3] <= 4
 Truck_Capacity: x[2,0] <= 5
 Truck_Capacity: x[2,1] <= 2
 Truck_Capacity: x[2,2] <= 0
 Truck_Capacity: x[2,3] <= 10
 Truck_Capacity: x[3,0] <= 0
 Truck_Capacity: x[3,1] <= 4
 Truck_Capacity: x[3,2] <= 10
 Truck_Capacity: x[3,3] <= 0
 Non-negativity: x[0,0] >= 0
 Non-negativity: x[0,1] >= 0
 Non-negativity: x[0,2] >= 0
 Non-negativity: x[0,3] >= 0
 Non-negativity: x[1,0] >= 0
 Non-negativity: x[1,1] >= 0
 Non-negativity: x[1,2] >= 0
 Non-negativity: x[1,3] >= 0
 Non-negativity: x[2,0] >= 0
 Non-negativity: x[2,1] >= 0
 Non-negativity: x[2,2] >= 0
 Non-negativity: x[2,3] >= 0
 Non-negativity: x[3,0] >= 0
 Non-negativity: x[3,1] >= 0
 Non-negativity: x[3,2] >= 0
 Non-negativity: x[3,3] >= 0
Bounds
End
