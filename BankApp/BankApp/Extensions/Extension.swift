//
//  Extension.swift
//  BankApp
//
//  Created by Joni de Campos on 22/09/19.
//  Copyright © 2019 Joni Campos. All rights reserved.
//

import Foundation
import UIKit


//extende as funçoes de um String
extension String {
    
    
    //Função para formatar a data
    func formataData() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // This formate is input formated .
        
        let formateDate = dateFormatter.date(from: self)!
        dateFormatter.dateFormat = "dd/MM/yyyy" // Output Formated
        
        return dateFormatter.string(from: formateDate)
    }
    
    //Função para verificar se é numero
    func isNumber() -> Bool {
        let numberCharacters = NSCharacterSet.decimalDigits.inverted
        return !self.isEmpty && self.rangeOfCharacter(from: numberCharacters) == nil
    }
    
    //Função para validar a senha
    //Uma letra maiuscula
    //Um numero
    //Um caracter especial
    func validaSenha() -> Bool {
        var valid = true
        let capitalLetter  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetter)
        if !texttest.evaluate(with: self) {
            valid = false
        }
        
        let number  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", number)
        if !texttest1.evaluate(with: self) {
            valid = false
        }
        
        let specialCharacter  = ".*[!&^%$#@()/_*+-]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacter)
        if !texttest2.evaluate(with: self) {
            valid = false
        }
        
        return valid
    }
}

extension Double {
    //Função para formatação de Moeda com duas casas decimais e unidade monetária do Brasil
    func formataMoeda() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self))!
    }
}

extension UIView
{
    /*
     *  Essa extensão foi criada para a configuração de layout da view dentro da celula
     *  Para que ela seja considerada, é necessário passar parametros (individuais) dentro do storyboard
     *  cornerRadius - define o grau em que os cantos são arredondados
     *  borderWidth - define a largura da borda
     *  borderColor - define a cor da borda
     *  shadowOffset - define o tamanho da sombra
     *  shadowRadius - define o grau da sombra
     *  shadowColor - define a cor da sombra
     *  shadowOpacity - define a opacidade da sombra
     */
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            return layer.borderColor != nil ? UIColor(cgColor: layer.borderColor!) : nil
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
