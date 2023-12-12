# testbench-system-verilog

The provided code is written in SystemVerilog and consists of several classes and modules that work together to simulate an I2C interface. Here is a breakdown of the code and its functionality:

## transaction class:
  This class represents a single transaction in the I2C interface. It contains variables such as newd (indicating if it is a new transaction), wr (indicating if it is a write transaction), wdata (data to be written), addr (address for the transaction), rdata (data read from the transaction), and done (indicating if the transaction is done). It also includes constraints for the address range and the distribution of write and read transactions. The class has functions for displaying the transaction details and creating a copy of the transaction.

## generator class:
This class generates random transactions and puts them into a mailbox. It has a run task that repeats a specified number of times, randomizes a transaction, puts a copy of it into the mailbox, and displays the transaction details. It waits for events drvnext and sconext before repeating the process. Once the specified number of repetitions is done, it triggers the done event.

## driver class:
  This class receives transactions from the mailbox, drives the I2C interface signals accordingly, and displays the transaction details. It has a reset task that initializes the interface signals and waits for a certain number of clock cycles. The run task runs in an infinite loop, getting a transaction from the mailbox, driving the interface signals, waiting for the transaction to complete, and displaying the transaction details. It triggers the drvnext event after each transaction.

## monitor class:
  This class monitors the I2C interface signals, captures the transaction details, and puts them into a mailbox. It has a run task that runs in an infinite loop, checking for a new transaction on the interface, capturing the details, waiting for the transaction to complete, and displaying the transaction details. It puts the transaction into the mailbox if it is a write transaction.

## scoreboard class:
  This class compares the data read from the interface with the expected data and displays whether the data matches or not. It has a run task that runs in an infinite loop, getting a transaction from the mailbox, comparing the read data with the expected data, and displaying the result. It triggers the sconext event after each transaction.

## tb module:
  This module instantiates the generator, driver, monitor, and scoreboard classes. It also defines events and mailboxes for communication between the classes. It initializes the clock signal and runs the test by calling the pre_test, test, and post_test tasks. It also sets up VCD dumping for waveform analysis.

Overall, this code simulates the behavior of an I2C interface by generating random transactions, driving the interface signals, monitoring the signals, and comparing the read data with the expected data. It provides a comprehensive test environment for verifying the functionality of the I2C design.
