
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var teremok: UIButton!
    @IBOutlet weak var kolobok: UIButton!
    @IBOutlet weak var kurochka: UIButton!
    @IBOutlet weak var masha: UIButton!
    
    
    var SKAZKI : String = ""
    var player: AVAudioPlayer!
    let soundFiles = ["teremok","kolobok","kurochka","mashenka"]
    
    
    @IBAction func buttonskazk(_ sender: UIButton) {
        let tag = sender.tag
        if tag >= 1 && tag <= soundFiles.count{
            SKAZKI = soundFiles[tag - 1]
            playSound()
        }
        
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: SKAZKI, withExtension: "mp3") else {
            print("Файл со звуком не найден")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch let error {
            print("Ошибка при воспроизведении звука: \(error.localizedDescription)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageteremok = UIImage(named: "teremok")
        teremok.setImage(imageteremok?.withRenderingMode(.alwaysOriginal),for: UIControl.State.normal)
        teremok.layer.cornerRadius = 13
        
        let imagekolobok = UIImage(named: "kolobok")
        kolobok.setImage(imagekolobok?.withRenderingMode(.alwaysOriginal),for: UIControl.State.normal)
        kolobok.layer.cornerRadius = 13
        
        let imagekurochka = UIImage(named: "Ryaba")
        kurochka.setImage(imagekurochka?.withRenderingMode(.alwaysOriginal),for: UIControl.State.normal)
        kurochka.layer.cornerRadius = 13
        
        let imagemasha = UIImage(named: "masha")
        masha.setImage(imagemasha?.withRenderingMode(.alwaysOriginal),for: UIControl.State.normal)
        masha.layer.cornerRadius = 13
        do {
                   try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                   try AVAudioSession.sharedInstance().setActive(true)
               } catch {
                   print("Ошибка при настройке аудиосессии: \(error)")
               }
           
       
    }


}

