// Libreria de Framework
import SwiftUI
// Libreria de Accesibilidad
import AVFoundation

struct AccountView: View {
    
    //@State var notificationToggle: Bool = false
    //@State var locationUsage: Bool = false
    
    // Se asigna que el valor default del idioma sea 0
    @State var defaultLanguage: Int = 0
    // Arreglo de idiomas
    @State var languagesArray: [String] = ["Español", "English", "Arabic", "Czech", "Danish", "German", "Greek", "English (Australia)", "English (UK)", "English (Ireland)", "English (South Africa)", "Casteñano", "Finnish", "French (Canada)", "French", "Hebrew", "Hindi", "Hungarian", "Indonesian", "Italian", "Japanese", "Korean", "Dutch", "Dutch (Netherlands)", "Norwegian", "Polish", "Portuguese", "Portuguese (Portugal)", "Romanian", "Russian", "Slovak", "Swedish", "Thai", "Turkish", "Chinese", "Chinese (Hong Kong)", "Chinese (Taiwan)"]
    // Palabras que el usuario vaya a expesar
    @State var expressedWords: String = ""
    // El container de texto es automatico
    @State var containerHeight: CGFloat = 0
    // El idioma default es el español
    @State var usedLanguage: String = "es-MX"
    
    var body: some View {
        // Se inicializa el sintetizador
        let synthesizer = AVSpeechSynthesizer()
        // Se crea un elemento renderizado
        GeometryReader { g in
            VStack {
                // Formulario
                Form {
                    // Se realiza la seccion un un seleccionador de idioma
                    Section(header: Text("Seleccione el idioma")) {
                        Picker(selection: self.$defaultLanguage, label: Text("Idioma")) {
                            ForEach(0 ..< self.languagesArray.count, id: \.self) {
                                Text(self.languagesArray[$0]).tag($0).font(.system(size: 20))
                            }
                        }.font(.system(size: 20))
                        
                    }.font(.system(size: 20))
                    // Objeto AutoSizing
                    // Es el text area que aumenta segun el texto que se escriba, esto a partir de un height
                    // adaptativo y un limite
                    AutoSizingTF(hint: "Necesito...", text: $expressedWords, containerHeight: $containerHeight, onEnd: {
                        // Hacer cuando el teclado este cerrado
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    })
                    //.padding(.horizontal)
                    // Max height aqui...
                    .frame(height: containerHeight <= 360 ? containerHeight: 360)
                    //.background(Color.white)
                    .cornerRadius(10)
                    //.padding()
                    
                }.background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .navigationBarTitle("Dilo!")
                    
                
                // Espacio entre elementos
                Spacer()
                
                // Se crea el boton
                Button(action: {
                    // Se crean los elementos necesarios para el texto to speech
                    let utterance = AVSpeechUtterance(string: expressedWords)
                    utterance.voice = AVSpeechSynthesisVoice(language: returnLanguage(idioma:defaultLanguage))
                    utterance.rate = 0.51
                    
                    synthesizer.speak(utterance)
                }) {
                    HStack {
                        Text("Expresar")
                    }
                    .padding()
                    .frame(width: abs(g.size.width - 24), height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(5)
                }
                .padding(.top, 10)
                .padding(.bottom, 20)
            }
        }
        
        
    }
}

// Funcion que regresa el idioma segun la posicion del arreglo de idiomas
func returnLanguage(idioma: Int) -> String {
    switch idioma {
    case 0:
        return "es-MX"
    case 1:
        return "en-US"
    case 2:
        return "ar-SA"
    case 3:
        return "cs-CZ"
    case 4:
        return "da-DK"
    case 5:
        return "de-DE"
    case 6:
        return "el-GR"
    case 7:
        return "en-AU"
    case 8:
        return "en-GB"
    case 9:
        return "en-IE"
    case 10:
        return "en-IN"
    case 11:
        return "en-ZA"
    case 12:
        return "es-ES"
    case 13:
        return "fi-FI"
    case 14:
        return "fr-CA"
    case 15:
        return "fr-FR"
    case 16:
        return "he-IL"
    case 17:
        return "hi-IN"
    case 18:
        return "hu-HU"
    case 19:
        return "id-ID"
    case 20:
        return "it-IT"
    case 21:
        return "ja-JP"
    case 22:
        return "ko-KR"
    case 23:
        return "nl-BE"
    case 24:
        return "nl-NL"
    case 25:
        return "no-NO"
    case 26:
        return "pl-PL"
    case 27:
        return "pt-BR"
    case 28:
        return "pt-PT"
    case 29:
        return "ro-RO"
    case 30:
        return "ru-RU"
    case 31:
        return "sk-SK"
    case 32:
        return "sv-SE"
    case 33:
        return "th-TH"
    case 34:
        return "tr-TR"
    case 35:
        return "zh-CN"
    case 36:
        return "zh-HK"
    case 37:
        return "zh-TW"
    default:
        return "es-MX"
    }
}


// Construyendo el AutoSizing TextField
struct AutoSizingTF: UIViewRepresentable {
    
    var hint: String
    @Binding var text: String
    @Binding var containerHeight: CGFloat
    var onEnd : ()->()
    
    func makeCoordinator() -> Coordinator {
        return AutoSizingTF.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        // Se despliega el texto como un hint
        textView.text = hint
        textView.showsVerticalScrollIndicator = false
        textView.textColor = .gray
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 20)
        
        // Setting delegate
        textView.delegate = context.coordinator
        
        // Input Accessory View..
        // Tu propio size personalizado
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolBar.barStyle = .default
        
        // Se usa otro item como esapciador
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(context.coordinator.closekeyBoard))
        
        toolBar.items = [spacer, doneButton]
        toolBar.sizeToFit()
        
        textView.inputAccessoryView = toolBar
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        // Aqui empieza el height del alto del textField
        DispatchQueue.main.async {
            if containerHeight == 0 {
                containerHeight = uiView.contentSize.height
            }
        }
    }
    
    class Coordinator: NSObject, UITextViewDelegate{
        
        //Para leer todas sus propiedades padre
        var parent: AutoSizingTF
        
        init(parent: AutoSizingTF){
            self.parent = parent
        }
        
        // @Objc function al cerrar el teclado...
        @objc func closekeyBoard(){
            parent.onEnd()
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            // Verificar si el texto esta vacio
            // Si lo esta, se limpiara el hint
            if textView.text == parent.hint{
                textView.text = ""
                textView.textColor = UIColor(Color.primary)
            }
        }
        
        // Se actualiza el texto en la View
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
            parent.containerHeight = textView.contentSize.height
        }
        
        // Verifica que el text box este vacio
        // Si es asi el hint se modifica
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text == ""{
                textView.text = parent.hint
                textView.textColor = .gray
            }
        }
        
    }
    
}
