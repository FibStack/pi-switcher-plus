from cffi import FFI
from fibstacklib_cffi import lib as fib
from fibstacklibpy.fibstack_board import FibstackBoard

class FibstackContext:
    """
    This class keeps track of all Fibstack boards connected.

    Each FibStack board has an associated FibstackBoard object.
    The FibstackContext object stores these objects into an internal map.
    
    """
    
    __context = fib.fibstack_context_new()
    __boards_dict = { }
    __ffi = FFI()
    
    def get_total_boards(self):
        """Returns the number of total Fibstack boards connected."""
        return fib.fibstack_context_get_board_number(self.__context)
    
    def update(self):
        """Updates the boards information."""
        self.__boards_dict.clear()
        fib.fibstack_context_update(self.__context)
    
    def get_board_by_index(self, index):
        """
        Returns the FibstackBoard object for the specified index.
        
        Parameters
        ----------
        :param index:
            The index of the FibstackBoard object to be returned
        
        Returns
        -------
        Returns an instance of FibstackBoard object if found. 
        Otherwise, it returns the None value.
        """
        board_key = fib.fibstack_context_get_board_by_index(self.__context, index)
        return self.__get_board(board_key)
    
    def get_board_by_address(self, address):
        """
        Returns the FibstackBoard object for the specified address.
        
        Parameters
        ----------
        :param address:
            The I2C address of the FibstackBoard object to be returned
        
        Returns
        -------
        Returns an instance of FibstackBoard object if found. 
        Otherwise, it returns the None value.
        """
        board_key = fib.fibstack_context_get_board_by_address(self.__context, address)
        return self.__get_board(board_key)
    
    def __get_board(self, board_key):
        board = None
        if board_key in self.__boards_dict:
            board = self.__boards_dict[board_key]
        elif board_key != self.__ffi.NULL:
            board = FibstackBoard(board_key)
            self.__boards_dict[board_key] = board
        return board

    def __del__(self):
        fib.fibstack_context_free(self.__context)
