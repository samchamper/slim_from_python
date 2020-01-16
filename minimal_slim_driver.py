# Author: Sam Champer

# This is an example of how to use Python as a driver for SLiM.
# Output is formated as a csv, but just printed to stdout by default.

from argparse import ArgumentParser
import subprocess
import os


def run_slim(command_line_args):
    """
    Runs SLiM using subprocess.
    Args:
        command_line_args: list; a list of command line arguments.
    return: The entire SLiM output as a string.
    """
    slim = subprocess.Popen(command_line_args,
                            stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE,
                            universal_newlines=True)
    # Info for debugging purposes:
    # std.out from the subprocess is in slim.communicate()[0]
    # std.error from the subprocess is in slim.communicate()[1]
    #err = slim.communicate()[1]
    #print(err)
    out = slim.communicate()[0]
    return out


def parse_slim(slim_string):
    """
    Parse the output of SLiM to extract whatever data we're looking for.
    If we want to do a more complex analysis on the output of the SLiM file,
    this is where we do it.
    Args:
        slim_string: the entire output of a run of SLiM.
    Return
        output: the parsed output of SLiM
    """
    # The SLiM file has been configured that all the output we want is printed
    # on lines that start with "PYTHON::"
    # Discard all lines that don't start with "OUT:"
    output = ""
    lines = slim_string.split('\n')
    for line in lines:
        if line.startswith("OUT:"):
            output += line.split(":")[1]  # Discard the "OUT:" from each line.
    return output


def main():
    """
    1. Configure using argparse.
    2. Generate the command line list to pass to subprocess through the run_slim() function.
    3. Run SLiM.
    4. Process the output of SLiM to extract the information we want.
    5. Print the results.
    """
    # Get args from arg parser:
    parser = ArgumentParser()
    parser.add_argument('-src', '--source', default="minimal_gene_drive.slim", type=str,
                        help=r"SLiM file to be run. Default 'minimal_gene_drive.slim'")
    parser.add_argument('-header', '--print_header',
                        dest='print_header', action='store_true', default=False,
                        help='If this is set, python prints a header for a csv file.')

    parser.add_argument('-homing', '--HOMING_SUCCESS_RATE', default=1.0, type=float,
                        help='The drive homing rate. Default 100 percent.')
    parser.add_argument('-res', '--RESISTANCE_FORMATION_RATE', default=0.0, type=float,
                        help='The resistance formation rate. Default 0 percent.')
    parser.add_argument('-suppression', '--RECESSIVE_FEMALE_STERILE_SUPPRESSION',
                        dest='RECESSIVE_FEMALE_STERILE_SUPPRESSION', action='store_true', default=False,
                        help='Toggles the drive to a suppression drive. Default is modifcation drive (non-suppression).')

    args_dict = vars(parser.parse_args())

    # Print a header for the output. Probably only do this for the first SLiM sim in an array of sims:
    if args_dict["print_header"]:
        print("Drive homing rate,Resistance formation rate,rate wt,rate dr," \
            "rate of function preserving resistance,rate of function disrupting resistance," \
            "rate of inds with at least 1 drive copy,ending pop size")

    # Next, assemble a list of all the command line arguments. We're running SLiM, so the first arg is simple:
    clargs = ["slim"]

    # Now add each argument from arg parser to the command line arguemnts for SLiM:
    for arg in args_dict:
        if arg == 'source' or arg == 'print_header':
            continue
        if isinstance(args_dict[arg], bool):
            clargs.append('-d')
            clargs.append(f"{arg}={'T' if args_dict[arg] else 'F'}")
        else:
            clargs.append('-d')
            clargs.append(f"{arg}={args_dict[arg]}")
    clargs.append(args_dict["source"])

    # Run the file.
    slim_result = run_slim(clargs)

    # Parse the result.
    parsed_result = parse_slim(slim_result)

    # At this point, we could do anything we want with the data, but we'll just print it.
    print(parsed_result)


if __name__ == "__main__":
    main()

