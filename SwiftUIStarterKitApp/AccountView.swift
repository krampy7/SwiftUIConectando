import SwiftUI
import AVFoundation

struct AccountView: View {
    @State var notificationToggle: Bool = false
    @State var locationUsage: Bool = false
    @State var defaultLanguage: Int = 0
    @State var languagesArray: [String] = ["Español", "English"]
    @State var expressedWords: String = ""
    @State var containerHeight: CGFloat = 0
    
    var body: some View {
        GeometryReader { g in
            VStack {
                Form {
                    
                    Section(header: Text("Seleccione el idioma")) {
                        Picker(selection: self.$defaultLanguage, label: Text("Idioma")) {
                                         ForEach(0 ..< self.languagesArray.count, id: \.self) {
                                                  Text(self.languagesArray[$0]).tag($0).font(.system(size: 20))
                                            }
                        }.font(.system(size: 20))

                    }.font(.system(size: 20))
                    
                    AutoSizingTF(hint: "Necesito...", text: $expressedWords, containerHeight: $containerHeight, onEnd: {
                        // Hacer cuando el teclado este cerrado
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    })
                        //.padding(.horizontal)
                        // Max height aqui...
                        .frame(height: containerHeight <= 320 ? containerHeight: 320)
                        .background(Color.white)
                        .cornerRadius(10)
                        //.padding()
                        
                    
                    
                }.background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationBarTitle("Dilo!")
        
                Spacer()
                Button(action: {
                    let utterance = AVSpeechUtterance(string: expressedWords)
                    utterance.voice = AVSpeechSynthesisVoice(language: "es-MX")
                    utterance.rate = 0.52
                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speak(utterance)
                    }) {
                        HStack {
                        Text("Expresar")
                    }
                    .padding()
                    .frame(width: abs(g.size.width - 24), height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(5)
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 20)
            }
        }
        
        
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
