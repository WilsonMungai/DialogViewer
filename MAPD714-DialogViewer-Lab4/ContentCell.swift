import UIKit

class ContentCell: UICollectionViewCell
{
    var label: UILabel!
    var maxWidth: CGFloat!
    var text: String!
    {
            get
        {
            return label.text
        }
    
        set(newText)
        {
            label.text = newText
            var newLabelFrame = label.frame
            var newContentFrame = contentView.frame
            let textSize = type(of: self).sizeForContentString(s: newText, forMaxWidth: maxWidth)
            newLabelFrame.size = textSize
            newContentFrame.size = textSize
            label.frame = newLabelFrame
            contentView.frame = newContentFrame
        }
    }
    
    //initializer takes a frame thats a rectangle CGRect
    override init(frame: CGRect)
    {
        // Parse box to back to super initializer
        super.init(frame: frame)
        
        // Label configuration
        
        // Creates a label. Gives the content view is attached to
        label = UILabel(frame: self.contentView.bounds)
        
        // Set background to opaque false
        label.isOpaque = false
        
        label.backgroundColor =
            UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        
        // Add label to content view
        contentView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    
    class func sizeForContentString(s: String, forMaxWidth maxWidth: CGFloat) -> CGSize
    {
        let maxSize = CGSize(width: maxWidth, height: 1000.0)
        let opts = NSStringDrawingOptions.usesLineFragmentOrigin
            
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = NSLineBreakMode.byCharWrapping
        let attributes = [ NSAttributedString.Key.font: defaultFont(),
                        NSAttributedString.Key.paragraphStyle: style]
            
        let string = s as NSString
        let rect = string.boundingRect(with: maxSize, options: opts, attributes: attributes, context: nil)
        return rect.size
    }
    
    class func defaultFont() -> UIFont
    {
        return UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
    }
    
}
