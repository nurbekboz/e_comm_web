import 'package:flutter/material.dart';

class KullanimKosullari extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Kullanım Koşulları",
        ),
        backgroundColor: Color(0xfff54a8c7),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.all(8.0),
                child:  Text(
                  'BursaTanık daha kaliteli ve daha eğlenceli içerik için aşağıdaki maddeleri uygulama konusunda duyarlılığınızı bekliyoruz.\nHakaret – Kişisel Bilgiler: İfade özgürlüğünü destekliyoruz. Ancak, üyelerimize kendilerini özgür şekilde ifade etme alanı sunarken, başkalarını taciz etme ve karalama imkanı vermemekteyiz. Kişi veya grupların dinini, dilini, cinsiyetini, ırkını, etnik grubunu, milliyetini aşağılayıcı içeriğe izin vermiyoruz. Saldırgan davranışlar, tehdit, taciz, özel yaşama saldırı, diğer kullanıcıların kişisel bilgilerinin ifşası hoşgörü sınırlarımızın dışında. Bu içeriğe sahip içerik hiçbir uyarı olmaksızın silinecektir. Gerekli görülürse ilgili üyelik hiçbir uyarı olmaksızın kapatılacaktır.\nPornografi: Pornografinin hiçbir türüne izin vermemekteyiz. Yetişkin cinsel organlarının, cinsel eylemlerin sergilendiği görüntüler veya yazılar hoşgörü sınırlarımızın dışındadır. Özellikle çocuk/ergen çıplaklığı, pornografisi veya bunları teşvik eden veya andıran içerikler konusunda ciddi hassasiyet göstermekteyiz. Bu içeriğe sahip içerik hiçbir uyarı olmaksızın silinecektir. Gerekli görülürse ilgili üyelik hiçbir uyarı olmaksızın kapatılacaktır.\nZararlı Alışkanlıklar: Satışı veya kullanımı reçeteye bağlı her türlü ilaç ile uyuşturucu madde kapsamına giren ve bağımlılık yaratan bilumum maddelerin tanıtımı, pazarlaması, tavsiyesi mahiyetinde içerik hiçbir uyarı olmaksızın silinecektir. Gerekli görülürse ilgili üyelik hiçbir uyarı olmaksızın kapatılacaktır.\nAşırı Şiddet: Şiddeti yaşamımızdan ve bilgisayarımızdan uzak tutmak istiyoruz. Bir insana ya da hayvana acı çektirilmesi, aşağılanması, saldırılması hoşgörü sınırlarımızın dışındadır. Dolayısıyla, her türlü insan veya hayvan yaralama, öldürme, parçalama, vahşet kısaca insan psikolojisi açısından ciddi sakıncalar barındıran her türlü yayını içeren içerik hiçbir uyarı olmaksızın silinecektir. Gerekli görülürse ilgili üyelik hiçbir uyarı olmaksızın kapatılacaktır.\nSilahlar ve Patlayıcı Maddeler: Yasadışı silah veya patlayıcı madde yapımı, pazarlaması veya kullanımına ilişkin içerik yayınlayan içerik hiçbir uyarı olmaksızın silinecektir. Gerekli görülürse ilgili üyelik hiçbir uyarı olmaksızın kapatılacaktır.\nResmi İçerik: Görüntü alınmasına veya fotoğraf çekilmesine izin verilmeyen askeri veya diğer resmi kurumlara ait videolar hiçbir uyarı olmaksızın silinecektir. Gerekli görülürse ilgili üyelik hiçbir uyarı olmaksızın kapatılacaktır.\nFikri ve Sınai Mülkiyet Hakları: Başkalarına ait fikri ve sınai mülkiyet haklarının korunması için gerekli özenin gösterilmesi gerekmektedir. Bu kapsamda Kullanıcılar sadece fikri ve sınai mülkiyet hakları kendisine ait olan (eser sahibi olarak veya eserlerin kullanım, yayınlama ve iletim haklarının yasal lisans sahibi olarak) İçeriği Siteye yükleyebilir. Eğer Kullanıcı fikri ve sınai mülkiyet hakları başkasına (diğer Kullanıcılar dahil) ait olan video, fotoğraf, resim, yazı vb. İçeriği, söz konusu hak sahiplerinin izni olmaksızın kopyalar, kullanır, yayınlar, dağıtır, umuma iletirse, BursaTanık ihlale konu olan İçeriği -hiçbir uyarıya veya izne gerek olmaksızın- Siteden kaldırmak ve gerektiğinde bu ihlali gerçekleştiren Kullanıcılar in üyeliğine son vermek haklarına sahiptir. Üçüncü şahısların fikri ve sınai mülkiyet haklarını ihlal eden Kullanıcılar, bu ihlallerden ve bu ihlallerden doğan her türlü zarardan üçüncü şahıslara karşı bizzat sorumludurlar.\nSiyaset veya Dini İçerik : Her siyasi görüşe ve dine saygı duyuyor ama bunların suistimal edilmesini istemiyoruz. Bu yüzden siyasi veya dini içerik yayınlayan hiçbir uyarı olmaksızın silinecektir. Gerekli görülürse ilgili üyelik hiçbir uyarı olmaksızın kapatılacaktır.\nYasalara Aykırılık: Yasanın suç saydığı fiilleri öven, suça özendiren, ticari olarak haksız rekabete neden olan, illegal bilgisayar yazılımı tanıtan tüm içerik da hiçbir uyarı olmaksızın silinecektir. Gerekli görülürse ilgili üyelik hiçbir uyarı olmaksızın kapatılacaktır.\nKullanıcı Şikayeti: BursaTanık içerik ve kullanıcı sayısının fazlalığı sebebiyle nadiren de olsa yukarıda belirtilen unsurlardan birinin veya birkaçının yanlışlıkla sitemizde yer aldığı durumlarda şahsınız ya da toplum adına bizi uyarmaktan kaçınmayınız. Uyarınız derhal ilgili departmanlarımızca incelenerek dikkate alınacak ve aykırılık en kısa sürede giderilecektir.\n',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
