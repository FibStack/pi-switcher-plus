#!/usr/bin/python3

import os
import flask
from flask_cors import CORS
from fibstacklibpy import FibstackContext

BAD_REQUEST_MSG = 'Bad request'

app = flask.Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*", "send_wildcard": "False"}})
port = 4545 if os.getenv('FIBSTACK_PORT') == None else os.getenv('FIBSTACK_PORT')
context = FibstackContext()

@app.route('/', methods=['GET'])
def home():
    """
    Web Application entry point
    """
    return app.send_static_file('index.html')


@app.route('/boards', methods=['GET'])
def get_boards():
    """
    Returns the information about all Fibstack boards connected in a JSON format
    """
    context.update()
    total_boards = context.get_total_boards()
    boards = []
    for i in range(total_boards):
        board = context.get_board_by_index(i)
        boards.append(board.to_json())
    return flask.jsonify(boards)


@app.route('/boards/index/<board_index>', methods=['GET'])
def get_board_by_index(board_index):
    """
    Returns the board object for specified index in JSON format
    
    :param board_index: The board index
    """
    board = context.get_board_by_index(int(board_index))
    if board is not None:
        return flask.jsonify(board.to_json())
    else:
        return BAD_REQUEST_MSG, 400

@app.route('/boards/address/<board_address>', methods=['GET'])
def get_board_by_address(board_address):
    """
    Returns the board object for specified I2C address in JSON format
    
    :param board_address: The board I2C address
    """
    board = context.get_board_by_address(int(board_address))
    if board is not None:
        return flask.jsonify(board.to_json())
    else:
        return BAD_REQUEST_MSG, 400

@app.route('/set', methods=['POST'])
def set_value():
    """ Process POST request for setting a device value
    
    If parameters are missing or defined incoreclty the function will return 400 HTTP response.
    """
    try:
        board_address = int(flask.request.get_json().get('boardAddress'))
        device_id = int(flask.request.get_json().get('deviceId'))
        new_value = int(flask.request.get_json().get('newValue'))
        board = context.get_board_by_address(board_address)
        
        if board is not None:
            board.set_device_value(device_id, new_value)
            device = board.get_device(device_id)
            return flask.jsonify(device.to_json())
        else:
            return BAD_REQUEST_MSG, 400
    except (TypeError, ValueError):
        return BAD_REQUEST_MSG, 400

@app.route('/set-address', methods=['POST'])
def set_address():
    """
    Sets the Fibstack Board I2C address.
    If any of the parameters is invalid, it will return HTTP Error 400 - Bad request.
    If the address was set successfuly, then it will return the board object with the updated address
    
    """
    try:
        board_address = int(flask.request.get_json().get('boardAddress'))
        new_address = int(flask.request.get_json().get('newAddress'))
        board = context.get_board_by_address(board_address)
        
        if board is not None and board_address == board.address and board_address != new_address:
            board.set_address(new_address)
            return flask.jsonify(board.to_json())
        else:
            return BAD_REQUEST_MSG, 400
    except (TypeError, ValueError):
        return BAD_REQUEST_MSG, 400


app.run(host='0.0.0.0', port=port)
