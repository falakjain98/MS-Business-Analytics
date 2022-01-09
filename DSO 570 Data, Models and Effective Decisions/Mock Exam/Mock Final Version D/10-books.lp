\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  x[Airport,0]
Subject To
 R0: x[Downtown,0] - x[Downtown,1] >= 0
 R1: x[Downtown,1] - x[Downtown,2] >= 0
 R2: x[Downtown,2] - x[Downtown,3] >= 0
 R3: x[Downtown,3] - x[Downtown,4] >= 0
 R4: x[Downtown,4] - x[Downtown,5] >= 0
 R5: x[Downtown,5] - x[Downtown,6] >= 0
 R6: x[Downtown,6] - x[Downtown,7] >= 0
 R7: x[Downtown,0] - x[Airport,1] >= 0
 R8: x[Downtown,1] - x[Airport,2] >= 0
 R9: x[Downtown,2] - x[Airport,3] >= 0
 R10: x[Downtown,3] - x[Airport,4] >= 0
 R11: x[Downtown,4] - x[Airport,5] >= 0
 R12: x[Downtown,5] - x[Airport,6] >= 0
 R13: x[Downtown,6] - x[Airport,7] >= 0
 R14: - x[Downtown,1] + x[Airport,0] >= 0
 R15: - x[Downtown,2] + x[Airport,1] >= 0
 R16: - x[Downtown,3] + x[Airport,2] >= 0
 R17: - x[Downtown,4] + x[Airport,3] >= 0
 R18: - x[Downtown,5] + x[Airport,4] >= 0
 R19: - x[Downtown,6] + x[Airport,5] >= 0
 R20: - x[Downtown,7] + x[Airport,6] >= 0
 R21: x[Airport,0] - x[Airport,1] >= 0
 R22: x[Airport,1] - x[Airport,2] >= 0
 R23: x[Airport,2] - x[Airport,3] >= 0
 R24: x[Airport,3] - x[Airport,4] >= 0
 R25: x[Airport,4] - x[Airport,5] >= 0
 R26: x[Airport,5] - x[Airport,6] >= 0
 R27: x[Airport,6] - x[Airport,7] >= 0
 R28: x[Downtown,0] - 0.95 x[Downtown,1] - 0.05 x[Airport,1] >= 12.5
 R29: x[Downtown,0] >= 0
 R30: x[Downtown,1] - 0.95 x[Downtown,2] - 0.05 x[Airport,2] >= 12.5
 R31: x[Downtown,1] >= 0
 R32: x[Downtown,2] - 0.95 x[Downtown,3] - 0.05 x[Airport,3] >= 12.5
 R33: x[Downtown,2] >= 0
 R34: x[Downtown,3] - 0.95 x[Downtown,4] - 0.05 x[Airport,4] >= 12.5
 R35: x[Downtown,3] >= 0
 R36: x[Downtown,4] - 0.95 x[Downtown,5] - 0.05 x[Airport,5] >= 12.5
 R37: x[Downtown,4] >= 0
 R38: x[Downtown,5] - 0.95 x[Downtown,6] - 0.05 x[Airport,6] >= 12.5
 R39: x[Downtown,5] >= 0
 R40: x[Downtown,6] - 0.95 x[Downtown,7] - 0.05 x[Airport,7] >= 12.5
 R41: x[Downtown,6] >= 0
 R42: - x[Downtown,1] + x[Airport,0] >= 70
 R43: x[Airport,0] >= 0
 R44: - x[Downtown,2] + x[Airport,1] >= 70
 R45: x[Airport,1] >= 0
 R46: - x[Downtown,3] + x[Airport,2] >= 70
 R47: x[Airport,2] >= 0
 R48: - x[Downtown,4] + x[Airport,3] >= 70
 R49: x[Airport,3] >= 0
 R50: - x[Downtown,5] + x[Airport,4] >= 70
 R51: x[Airport,4] >= 0
 R52: - x[Downtown,6] + x[Airport,5] >= 70
 R53: x[Airport,5] >= 0
 R54: - x[Downtown,7] + x[Airport,6] >= 70
 R55: x[Airport,6] >= 0
Bounds
End
