package cool;

import java.util.Map;
import java.util.HashMap;
import java.util.HashSet;
import java.lang.StringBuilder;

class VisitorImpl extends ExpressionVisitorImpl {

    private void programVisitorDepthFirstHelper(InheritanceGraph.Node node) {
        // enter scope
        GlobalData.scopeTable.enterScope();
        GlobalData.methodDefinitionScopeTable.enterScope();

        // visit the node
        node.getAstClass().accept(this);

        // iterate through all the child nodes
        for(InheritanceGraph.Node child: node.getChildren()) {
            programVisitorDepthFirstHelper(child);
        }

        // exit scope
        GlobalData.methodDefinitionScopeTable.exitScope();
        GlobalData.scopeTable.exitScope();
    }

    // TODO: add all mangled name in the global data

    private void updateMangledNames(AST.program prog) {
        for(AST.class_ cl: prog.classes) {
            for(AST.feature f: cl.features) {
                if(f instanceof AST.method) {
                    AST.method m = (AST.method) f;
                    GlobalData.mangledNameMap.put(GlobalData.getMangledNameWithFormals(cl.name, m.name, m.typeid, m.formals), m.typeid);
                }
            }
        }        
    }

    public void visit(AST.program prog) {

        // preparing inheritance graph
        GlobalData.inheritanceGraph = new InheritanceGraph();

        for(AST.class_ cl: prog.classes) {
            GlobalData.filename = cl.filename;
            GlobalData.inheritanceGraph.addClass(cl);
        }
        GlobalData.inheritanceGraph.analyze();

        if(GlobalData.errors.size() > 0) {
            // errors in inheritance graph
            return;
        }

        updateMangledNames(prog);

        InheritanceGraph.Node rootNode = GlobalData.inheritanceGraph.getRootNode();
        programVisitorDepthFirstHelper(rootNode);

    }


    public void visit(AST.class_ cl) {
        GlobalData.currentClass = cl.name;

        // adding variables to the scope
        // TODO: check if declared already
        for(AST.feature f: cl.features) {
            if(f instanceof AST.attr) { // Its a variable
                AST.attr a = (AST.attr) f;
                if(GlobalData.scopeTable.lookUpGlobal(a.name) == null) {
                    // not defined earlier, all clear
                    GlobalData.scopeTable.insert(a.name, a.typeid);
                } else {
                    // already defined
                    StringBuilder errorMessage = new StringBuilder();
                    errorMessage.append("Attribute '").append(a.name);
                    if(GlobalData.scopeTable.lookUpLocal(a.name) == null) {
                        // defined in parent classes
                        errorMessage.append("' has been already defined in inherited tree.");
                    } else {
                        // defined in current class
                        errorMessage.append("' has multiple definitions in the class '")
                            .append(cl.name).append("'");
                    }
                    GlobalData.errors.add(new Error(GlobalData.filename, a.getLineNo(), errorMessage.toString()));
                    // TODO: should we add redeclaration in scope for further analysis? Or return?
                }
            } else { // Its a method
                AST.method m = (AST.method) f;
                if(GlobalData.methodDefinitionScopeTable.lookUpLocal(m.name)!=null) {
                    // Already present in the current class
                    StringBuilder errorMessage = new StringBuilder();
                    errorMessage.append("Method '").append(m.name);
                    errorMessage.append("' has multiple definitions in the class '").append(cl.name).append("'");
                    GlobalData.errors.add(new Error(GlobalData.filename, m.getLineNo(), errorMessage.toString()));
                } else {
                    // className = null, because we will check mangled name with parent classes
                    String mangledName = GlobalData.getMangledNameWithFormals(null, m.name, m.typeid, m.formals);
                    
                    String scopeMangledName;
                    if((scopeMangledName=GlobalData.methodDefinitionScopeTable.lookUpGlobal(m.name))!=null
                        && !scopeMangledName.equals(mangledName)) {
                        // it has been defined in parent class
                        // and the method signatures does not match
                        StringBuilder errorMessage = new StringBuilder();
                        errorMessage.append("Redefined method '").append(m.name).append("' in class '")
                        .append(cl.name).append("' doesn't follow method signature of inherited class.");
                        GlobalData.errors.add(new Error(GlobalData.filename, m.getLineNo(), errorMessage.toString()));
                    }

                    GlobalData.methodDefinitionScopeTable.insert(m.name, mangledName);
                }
            }
        }

        // visiting all features
        for(AST.feature f: cl.features) {
            f.accept(this);
        }

    }

    public void visit(AST.attr at) {
        if(!GlobalData.inheritanceGraph.hasClass(at.typeid)) {
            // using undefined type
            StringBuilder errorMessage = new StringBuilder();
            errorMessage.append("Type '").append(at.typeid).append("' for attribute '")
            .append(at.name).append("' has not been defined");
            GlobalData.errors.add(new Error(GlobalData.filename, at.getLineNo(), errorMessage.toString()));
        } else if(!(at.value instanceof AST.no_expr)) { // assignment exists
            // visiting expression
            at.value.accept(this);

            // checking type of variable and assignment
            if(!at.typeid.equals(at.value.type)) {
                StringBuilder errorMessage = new StringBuilder();
                errorMessage.append("Assignment doesn't match the type of attribute ")
                .append(at.name).append(":").append(at.typeid);
                GlobalData.errors.add(new Error(GlobalData.filename, at.getLineNo(), errorMessage.toString()));
            }
        }
    }

    public void visit(AST.method mthd) {
        // visiting all the formals
        for(AST.formal fm: mthd.formals) {
            fm.accept(this);
        }

        mthd.body.accept(this);
        if(!mthd.typeid.equals(mthd.body.type)) {
            StringBuilder errorMessage = new StringBuilder();
            errorMessage.append("Return type of method '")
            .append(mthd.name).append("'' doesn't match with return type of its body.");
            GlobalData.errors.add(new Error(GlobalData.filename, mthd.getLineNo(), errorMessage.toString()));
        }
    }

    public void visit(AST.formal fm) {
        if(!GlobalData.inheritanceGraph.hasClass(fm.typeid)) {
            // using undefined type
            StringBuilder errorMessage = new StringBuilder();
            errorMessage.append("Type '").append(fm.typeid).append("' for formal '")
            .append(fm.name).append("' has not been defined");
            GlobalData.errors.add(new Error(GlobalData.filename, fm.getLineNo(), errorMessage.toString()));
        }
    }

}