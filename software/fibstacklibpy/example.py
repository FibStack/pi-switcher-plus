import time
from fibstacklibpy import FibstackContext

half_adc_value = 2048
context = FibstackContext()
total_boards = context.get_total_boards()

if total_boards > 0:
    # Assuming at least one Fibstack Board is connected
    board = context.get_board_by_index(0)
    
    while True:
        # When calling get_device() method, internally it will call 
        # update() method to get the curent value from the board
        switch_device0 = board.get_device(0)
        adc_device0 = board.get_device(4)
        
        print("Relay Switch: {0},  ADC Value: {1}".format(switch_device0.value, adc_device0.value))
        
        if not switch_device0.value and adc_device0.value > half_adc_value:
            board.set_device_value(switch_device0.id, True)
        elif switch_device0.value and adc_device0.value <= half_adc_value:
            board.set_device_value(switch_device0.id, False)
        
        time.sleep(1)
