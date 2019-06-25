
import UIKit

class StatementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var lbPayment: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbValue: UILabel!
    
    var statemeant: Statemeant!{
        didSet{
            lbPayment.text = self.statemeant.title
            lbValue.text = (self.statemeant.value ?? 0.0).toCurrency
            lbDate.text = self.statemeant.date?.toShortDate
            lbDescription.text = self.statemeant.desc
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
        setupView()
        setupLabel()
    }
    
    func setupView(){
        viewCell.layer.cornerRadius = 5
        viewCell.backgroundColor = .white
        viewCell.layer.shadowOffset = CGSize(width: 1, height: 3)
        viewCell.layer.shadowRadius = 1
        viewCell.layer.shadowOpacity = 0.6
        viewCell.layer.shadowRadius = 3.0
        viewCell.layer.shadowColor = #colorLiteral(red: 0.8509803922, green: 0.8862745098, blue: 0.9137254902, alpha: 0.5)
        viewCell.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setupLabel() {
        lbDate.textColor = #colorLiteral(red: 0.6588235294, green: 0.7058823529, blue: 0.768627451, alpha: 1)
        lbDate.font = UIFont.systemFont(ofSize: 12)
        lbPayment.font = UIFont.systemFont(ofSize: 16)
        lbDescription.textColor = #colorLiteral(red: 0.2823529412, green: 0.3294117647, blue: 0.3960784314, alpha: 1)
        lbDescription.font = UIFont.systemFont(ofSize: 16)
        lbValue.textColor = #colorLiteral(red: 0.2823529412, green: 0.3294117647, blue: 0.3960784314, alpha: 1)
        lbValue.font = UIFont.systemFont(ofSize: 20)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
