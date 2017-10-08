package cool;

class IRPrinter {

    public static final String INDENT = "  ";

    public static final String BITCAST = "bitcast";
    public static final String TRUNC = "trunc";
    public static final String ADD = "add";
    public static final String SUB = "sub";
    public static final String MUL = "mul";
    public static final String DIV = "div";
    public static final String ZEXT = "zext";
    public static final String SLT = "icmp slt";
    public static final String SGE = "icmp sge";
    public static final String SGT = "icmp sgt";
    public static final String SLE = "icmp sle";
    public static final String EQ = "icmp eq";
    public static final String XOR = "xor";
    public static final String UNDEF = "undef";


    private static int getAlign(String type) {
        if(type.length() == 0) {
            return -1;
        }
        String checkPointerType = type.substring(type.length()-1);
        if("*".equals(checkPointerType)) {
            return 8;
        }
        return 4;
    }

    public static String createLoadInst(String mem, String type) {
        StringBuilder builder = new StringBuilder(INDENT);
        type = Utils.convertTypeWithPtr(type);
        String storeRegister = "%"+Global.registerCounter;
        Global.registerCounter++;
        builder.append(storeRegister);
        builder.append(" = load ").append(type);
        builder.append(", ").append(type+"*");
        builder.append(mem).append(", align ");
        builder.append(getAlign(type));
        Global.out.println(builder.toString());
        return storeRegister;
    }

    public static void createStoreInst(String reg, String mem, String type) {
        StringBuilder builder = new StringBuilder(INDENT);
        type = Utils.convertTypeWithPtr(type);
        builder.append("store ").append(type).append(" ");
        builder.append(reg).append(", ");
        builder.append(type+"*").append(" ");
        builder.append(mem).append(", align ");
        builder.append(getAlign(type));
        Global.out.println(builder.toString());
    }

    public static String createBinaryInst(String opType, String op1, String op2, 
                                            String type, boolean nuw, boolean nsw) {
        StringBuilder builder = new StringBuilder(INDENT);
        type = Utils.convertTypeWithPtr(type);
        String storeRegister = "%"+Global.registerCounter;
        Global.registerCounter++;
        builder.append(storeRegister);
        builder.append(" = ").append(opType).append(" ");
        if(nuw)
            builder.append("nuw ");
        if(nsw)
            builder.append("nsw");
        builder.append(type);
        builder.append(" ").append(op1).append(", ");
        builder.append(op2);
        Global.out.println(builder.toString());
        return storeRegister;
    }

    public static String createConvertInst(String reg, String exprFromType, String exprToType, String convertType) {
        StringBuilder builder = new StringBuilder(INDENT);
        exprFromType = Utils.convertTypeWithPtr(exprFromType);
        exprToType = Utils.convertTypeWithPtr(exprToType);
        String storeRegister = "%"+Global.registerCounter;
        Global.registerCounter++;
        builder.append(storeRegister);
        builder.append(" = ").append(convertType);
        builder.append(" ").append(exprFromType);
        builder.append(" ").append(reg).append(" to ");
        builder.append(exprToType);
        Global.out.println(builder.toString());
        return storeRegister;
    }

    public static void createBreakInst(String label) {
        StringBuilder builder = new StringBuilder(INDENT);
        builder.append("br label ").append(label);
        Global.out.println(builder.toString());
    }

    public static void createCondBreak(String reg, String label1, String label2) {
        StringBuilder builder = new StringBuilder(INDENT);
        builder.append("br i1 ");
        builder.append(reg).append(", ");
        builder.append("label ").append(label1);
        builder.append(", label ").append(label2);
        Global.out.println(builder.toString());
    }

    public static String createLabel(String label) {
        StringBuilder builder = new StringBuilder("\n");
        label = getLabel(label);
        builder.append(label).append(":");
        Global.out.println(builder.toString());
        return label;
    }

    public static String getLabel(String label) {
        if(!Global.labelToCountMap.containsKey(label)) {
            int value = Global.labelToCountMap.get(label);
            label = label + "." + value;
            Global.labelToCountMap.put(label, Global.labelToCountMap.get(label) + 1);
        }
        else {
            Global.labelToCountMap.put(label,1); // TODO : check this
        }
        return label;
    }

    public static String createPHINode(String type, String v1, String label1, String v2, String label2) {
        StringBuilder builder = new StringBuilder(INDENT);
        type = Utils.convertTypeWithPtr(type);
        String storeRegister = "%"+Global.registerCounter;
        Global.registerCounter++;
        builder.append(storeRegister);
        builder.append(" = phi ").append(type);
        builder.append(" [ ").append(v1).append(", %");
        builder.append(label1).append(" ] , [ ");
        builder.append(v2).append(", %");
        builder.append(label2).append(" ]");
        Global.out.println(builder.toString());
        return storeRegister;
    }

    public static String createReturnInst(String type, String val) {
        StringBuilder builder = new StringBuilder(INDENT);
        type = Utils.convertTypeWithPtr(type);
        builder.append("ret ").append(type);
        builder.append(" ").append(val);
        Global.out.println(builder.toString());
        return val;
    }

    public static String createCallInst(String type, String callee, String args) {
        StringBuilder builder = new StringBuilder(INDENT);
        type = Utils.convertTypeWithPtr(type);
        String storeRegisterForCall = "%"+Global.registerCounter;
        Global.registerCounter++;
        builder.append(storeRegisterForCall);
        builder.append(" = call ").append(type);
        builder.append(" ").append(callee);
        builder.append("(").append(args).append(")");
        Global.out.println(builder.toString());
        return storeRegisterForCall;
    }

}