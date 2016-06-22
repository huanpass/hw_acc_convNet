"""
This file is to generate p*p crossbar given k and M
M is the matrix size, k is p/M, # of lines processed in one cycle
"""

from generateVerilogUtil import *


def getInputIndex(outputIndex, k, M):
    assert M % k == 0, "k must be a divisor of M."
    groupIndex = outputIndex // M  # from [0, k)
    groupOffset = outputIndex % M  # from [0, M)
    subGroupIndex = groupOffset // k  # from [0, M/k)
    subGroupOffset = groupOffset % k  # from [0, k)
    j = groupIndex + 1 + subGroupIndex * k
    i = subGroupOffset + 1
    return (i - 1) * M + j - 1, i, j


def testGetInputIndex():
    k, M = 4, 8
    for _ in range(k * M):
        inputIndex, i, j = getInputIndex(_, k, M)
        coordinate = (i, j)
        print inputIndex, "->", coordinate, "->", _


def generateCrossBarVerilog(k, M, inputWidth, pipeline, fileName):
    f = open(fileName, "w")
    # generate the top comment
    f.write(generateVerilogNewLine(0, "/*"))
    f.write(generateVerilogNewLine(1, "* This file is automatically generated by Chi Zhang"))
    f.write(generateVerilogNewLine(1, "* k = " + str(k) + ", M = " + str(M)))
    f.write(generateVerilogNewLine(1, "*/"))
    crossbarSize = k * M
    crossbar = VerilogModule("crossbar" + str(crossbarSize) + "x" + str(crossbarSize))
    crossbar.addIO(ModuleIO(1, "clk", "input"))
    crossbar.addIO(ModuleIO(1, "clk_en", "input"))
    crossbar.addParam(ModuleParam("DATA_WIDTH", inputWidth))
    inputWidth = "DATA_WIDTH"
    for i in range(k  * M):
        crossbar.addIO(ModuleIO(inputWidth, "in" + str(i), "input"))

    if pipeline:
        for i in range(k * M):
            crossbar.addIO(ModuleIO(inputWidth, "out" + str(i), "output reg"))

        f.write(crossbar.__str__())
        f.write("\n")

        f.write(generateVerilogNewLine(2, "always@(posedge clk) begin"))
        f.write(generateVerilogNewLine(4, "if (clk_en) begin"))
        for outIO in crossbar.io:
            if outIO.getType() == "output reg":
                if len(outIO.getName()) == 4:
                    outIndex = outIO.getName()[-1:]
                else:
                    outIndex = outIO.getName()[-2:]
                inputIndex, _, _ = getInputIndex(int(outIndex), k, M)
                f.write(generateVerilogNewLine(6, outIO.getName() + " <= " + "in" + str(inputIndex) + ";"))
        f.write(generateVerilogNewLine(4, "end"))
        f.write(generateVerilogNewLine(2, "end"))
        f.write("\n")
        f.write(generateVerilogNewLine(0, "endmodule"))
        f.close()
    else:
        raise NotImplementedError("Not pipeline design is not implemented yet.")

if __name__ == "__main__":
    fileName = "test.v"
    k, M = 4, 8
    generateCrossBarVerilog(k, M, inputWidth=32, pipeline=True, fileName=fileName)
