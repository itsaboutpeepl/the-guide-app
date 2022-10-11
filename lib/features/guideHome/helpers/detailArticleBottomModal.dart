import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:guide_liverpool/features/guideHome/helpers/UrlLaunch.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:guide_liverpool/models/articles/blogArticle.dart';
import 'package:share_plus/share_plus.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailArticleBottomModel extends StatefulWidget {
  const DetailArticleBottomModel({Key? key, required this.articleData})
      : super(key: key);

  final BlogArticle articleData;

  @override
  _DetailArticleBottomModelState createState() =>
      _DetailArticleBottomModelState();
}

class _DetailArticleBottomModelState extends State<DetailArticleBottomModel> {
  int _currentIndex = 0;

  // ignore: unused_field
  late Timer _timer;
  late Widget htmlWidget;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      if (mounted) {
        setState(() {
          if (_currentIndex + 1 == widget.articleData.gallery.length) {
            _currentIndex = 0;
          } else {
            _currentIndex = _currentIndex + 1;
          }
        });
      }
    });

    htmlWidget = Html(
      data: widget.articleData.content,
      onLinkTap: (url, context, attributes, element) =>
          {UrlLaunch.launchURL(url!)},
      style: {
        "p": Style(fontSize: FontSize(16.0)),
        "h4": Style(fontSize: FontSize(21.0), fontWeight: FontWeight.w700)
      },
      customRenders: {
        iframeYT(): CustomRender.widget(
          widget: (context, buildChildren) {
            double? width =
                double.tryParse(context.tree.attributes['width'] ?? "");
            double? height =
                double.tryParse(context.tree.attributes['height'] ?? "");
            return Container(
              width: width ?? (height ?? 150) * 2,
              height: height ?? (width ?? 300) / 2,
              child: WebView(
                initialUrl: context.tree.attributes['src']!,
                javascriptMode: JavascriptMode.unrestricted,
                navigationDelegate: (NavigationRequest request) async {
                  //no need to load any url besides the embedded youtube url when displaying embedded youtube, so prevent url loading
                  if (!request.url.contains("youtube.com/embed")) {
                    return NavigationDecision.prevent;
                  } else {
                    return NavigationDecision.navigate;
                  }
                },
              ),
            );
          },
        ),
        // twitterVideo(): CustomRender.widget(widget: (context, buildChildren) {
        //   return Container(
        //     height: 500,
        //     child: WebView(
        //       initialUrl: context.tree.element!.innerHtml,
        //       javascriptMode: JavascriptMode.unrestricted,
        //       navigationDelegate: (NavigationRequest request) async {
        //         return NavigationDecision.navigate;
        //       },
        //     ),
        //   );
        // })
      },
    );
  }

  // CustomRenderMatcher twitterVideo() => (context) =>
  //     context.tree.element?.attributes['href']?.contains("t.co") ?? false;

  CustomRenderMatcher iframeYT() => (context) =>
      context.tree.element?.attributes['src']?.contains("youtube.com/embed") ??
      false;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.975,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => {Share.share(widget.articleData.postURL)},
          child: Icon(
            Icons.ios_share,
            color: Colors.white,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300.0,
                child: CarouselSlider(
                  items: widget.articleData.gallery
                      .map(
                        (item) => CachedNetworkImage(
                          memCacheHeight: 300,
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          imageUrl: item,
                          fit: BoxFit.cover,
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    height: double.infinity,
                    viewportFraction: 1,
                    autoPlayCurve: Curves.slowMiddle,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      widget.articleData.title,
                      style: TextStyle(
                          fontSize: 28.0, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(widget.articleData.category[0]),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey[300],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          DateFormat("EEE, MMM d, ''yy")
                              .format(widget.articleData.publishedAt),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    htmlWidget,
                    // Text(
                    //parseHtmlString(widget.articleData.content),
                    //   style: TextStyle(fontSize: 18.0),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// {
//         "iframe": (RenderContext context, Widget child) {
//           final attrs = context.tree.element?.attributes;
//           if (attrs != null) {
//             double? width = double.tryParse(attrs['width'] ?? "");
//             double? height = double.tryParse(attrs['height'] ?? "");
//             return Container(
//               width: width ?? (height ?? 150) * 2,
//               height: height ?? (width ?? 300) / 2,
//               child: WebView.WebView(
//                 initialUrl: attrs['src'] ?? "about:blank",
//                 javascriptMode: WebView.JavascriptMode.unrestricted,
//                 //no need for scrolling gesture recognizers on embedded youtube, so set gestureRecognizers null
//                 //on other iframe content scrolling might be necessary, so use VerticalDragGestureRecognizer
//                 gestureRecognizers: attrs['src'] != null &&
//                         attrs['src']!.contains("youtube.com/embed")
//                     ? null
//                     : [Factory(() => VerticalDragGestureRecognizer())].toSet(),
//                 navigationDelegate: (WebView.NavigationRequest request) async {
//                   //no need to load any url besides the embedded youtube url when displaying embedded youtube, so prevent url loading
//                   //on other iframe content allow all url loading
//                   if (attrs['src'] != null &&
//                       attrs['src']!.contains("youtube.com/embed")) {
//                     if (!request.url.contains("youtube.com/embed")) {
//                       return WebView.NavigationDecision.prevent;
//                     } else {
//                       return WebView.NavigationDecision.navigate;
//                     }
//                   } else {
//                     return WebView.NavigationDecision.navigate;
//                   }
//                 },
//               ),
//             );
//           } else {
//             return Container(height: 0);
//           }
//         },
//       },

// String tempContent = """
// <h3>It will be either down to Liverpool and Glasgow to host Eurovision 2023.</h3>
// <h4>Liverpool and Glasgow are the two cities which remain in the competition to host the 2023 Eurovision Song Contest, the BBC has announced.</h4>
// <p>They have been selected after Birmingham, Leeds, Newcastle, Sheffield and Manchester were removed from contention to host the music event in place of Ukraine.</p>
// <p><strong>Announcing the news, Phil Harrold, the chairman of the BBC’s host city selection committee, said: </strong></p>
// <p>“Thanks to all seven cities across the UK who have demonstrated the enthusiasm and passion for Eurovision that exists right across the UK.</p>
// <p>“We were incredibly impressed by the quality and creativity of all the city bids in what was a highly competitive field.</p>
// <p>“The Eurovision Song Contest is a very complex event and Liverpool and Glasgow have the strongest overall offer; we will continue our discussions with them to determine the eventual host city.</p>
// <p>“We are determined to make the 2023 Eurovision Song Contest one that both reflects the winning position of Ukraine and is also an event that all of the UK can participate in.”</p>

// <p><iframe loading="lazy" title="Liverpool&#039;s bid video to host the Eurovision Song Contest | The Guide Liverpool" width="550" height="309" 
// src="https://www.youtube.com/embed/u0x0WF-HFSU?feature=oembed" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>


// <p>Ukrainian entry Kalush Orchestra triumphed at the 2022 competition in Turin, Italy, but the European Broadcasting Union (EBU), which produces the annual event, decided the show cannot be safely held in the country following Russia’s invasion.</p>
// <p>Either Liverpool or Glasgow will host the 67th Eurovision Song Contest after the UK was given the chance to host the event for the ninth time – more than any other country – after Sam Ryder came second in the competition.</p>
// <p>Further discussions will now take place with officials from Glasgow and Liverpool and the host city will be announced “within weeks”, the BBC have said, with the final decision a matter for the BBC in conjunction with the EBU.</p>
// <p>In August a list narrowed down from 20 UK cities who initially submitted an “expression of interest” was released by the BBC, with applicants across all four regions demonstrating how they would reflect Ukrainian culture, music and communities.</p>
// <p>Of the seven cities named in August, six were in England, one in Scotland, with Belfast failing to make the cut for Northern Ireland.</p>
// <p>Requirements included “a suitable venue and sufficient space to deliver the requirements of the Song Contest”, necessary commitment to the contest including a financial contribution, and “alignment with the BBC’s strategic priorities as a public service broadcaster”.</p>
// <p>Liverpool, which has been a Unesco City of Music since 2015, is synonymous with The Beatles and has a rich music heritage.</p>
// <p>&nbsp;</p>

// <blockquote class="twitter-tweet">
// <p lang="en" dir="ltr">Let&#39;s get <a href="https://twitter.com/Eurovision?ref_src=twsrc%5Etfw">@Eurovision</a> to Liverpool. It&#39;s us or Glasgow 🤞🤞</p>
// <p>RT our video which was used in the official bid below and let&#39;s get <a href="https://twitter.com/hashtag/Eurovision?src=hash&amp;ref_src=twsrc%5Etfw">#Eurovision</a> to make the right choice 🌇🎶 <a href="https://t.co/wYZHTQZVAU">pic.twitter.com/wYZHTQZVAU</a> </p>
// <p>&mdash; The Guide Liverpool 🌇 (@TheGuideLpool) <a href="https://twitter.com/TheGuideLpool/status/1574755299331919873?ref_src=twsrc%5Etfw">September 27, 2022</a></p></blockquote>
// <p> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script></p>

// <p><strong>Mayor of Liverpool, Joanne Anderson said:</strong> “I’m so thrilled to hear Liverpool’s hopes of hosting Eurovision have moved a big step closer!</p>
// <p>We all know our city is great at hosting big events – nobody throws a party like Liverpool – and the judges at Eurovision agree.</p>
// <p>From The Beatles, to Cream, to the Royal Liverpool Philharmonic Orchestra – Liverpool always moves to its own beat – and hosting Eurovision would write a brand-new chapter in our musical heritage.</p>
// <p>In the short term however, it will be a huge boost to the local economy and will also provide a platform to sustain jobs well into the future.</p>
// <p>We are so proud to have the backing of our sister city in Ukraine – Odesa – and it would be a privilege to host Eurovision 2023 on behalf of them and the people of Ukraine.   </p>
// <p>Glasgow is a great city and so I don’t envy the judges who have to decide between us, but for me there is no city anywhere in Europe which would make a more perfect home for Eurovision than Liverpool” </p>
// <p><strong>Claire McColgan CBE, Director of Culture Liverpool, said: </strong>“The process of bidding for Eurovision has once again shown why Liverpool is such a brilliant event city.</p>
// <p>Partners from across the region – from hoteliers to the police, ACC Liverpool to the local hospitals – have got behind our plans and really stepped up to help bring this to the city.”</p>
// <p><strong>Steve Rotheram, Mayor of the Liverpool City Region, said: </strong>“It’s unsurprising that Liverpool has made it to the final two cities to host Eurovision because there’s nowhere better qualified or more fitting to host it than here in the UK’s cultural capital.</p>
// <p>Our reputation as a music heavyweight is unmatched. Not only are we a UNESCO City of Music, but no region in the UK has had more number one hits.</p>
// <p>We’ve shown time and time again that nowhere can throw a party quite like us – we’re ready to roll the red carpet out for a Eurovision celebration that the world will never forget!”</p>
// <p>Phil Harrold, the chair of the BBC’s Host City Selection Committee said: “The Eurovision Song Contest is a very complex event and Liverpool and Glasgow have the strongest overall offer; we will continue our discussions with them to determine the eventual host city.”</p>
// <h4>Share our Eurovision bid video on Twitter <a href="https://twitter.com/TheGuideLpool/status/1574755299331919873">HERE</a>.</h4>
// """;

/*

<h3>It will be either down to Liverpool and Glasgow to host Eurovision 2023.</h3>
<h4>Liverpool and Glasgow are the two cities which remain in the competition to host the 2023 Eurovision Song Contest, the BBC has announced.</h4>
<p>They have been selected after Birmingham, Leeds, Newcastle, Sheffield and Manchester were removed from contention to host the music event in place of Ukraine.</p>
<p><strong>Announcing the news, Phil Harrold, the chairman of the BBC’s host city selection committee, said: </strong></p>
<p>“Thanks to all seven cities across the UK who have demonstrated the enthusiasm and passion for Eurovision that exists right across the UK.</p>
<p>“We were incredibly impressed by the quality and creativity of all the city bids in what was a highly competitive field.</p>
<p>“The Eurovision Song Contest is a very complex event and Liverpool and Glasgow have the strongest overall offer; we will continue our discussions with them to determine the eventual host city.</p>
<p>“We are determined to make the 2023 Eurovision Song Contest one that both reflects the winning position of Ukraine and is also an event that all of the UK can participate in.”</p>

<p><iframe loading="lazy" title="Liverpool&#039;s bid video to host the Eurovision Song Contest | The Guide Liverpool" width="550" height="309" 
src="https://www.youtube.com/embed/u0x0WF-HFSU?feature=oembed" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>


<p>Ukrainian entry Kalush Orchestra triumphed at the 2022 competition in Turin, Italy, but the European Broadcasting Union (EBU), which produces the annual event, decided the show cannot be safely held in the country following Russia’s invasion.</p>
<p>Either Liverpool or Glasgow will host the 67th Eurovision Song Contest after the UK was given the chance to host the event for the ninth time – more than any other country – after Sam Ryder came second in the competition.</p>
<p>Further discussions will now take place with officials from Glasgow and Liverpool and the host city will be announced “within weeks”, the BBC have said, with the final decision a matter for the BBC in conjunction with the EBU.</p>
<p>In August a list narrowed down from 20 UK cities who initially submitted an “expression of interest” was released by the BBC, with applicants across all four regions demonstrating how they would reflect Ukrainian culture, music and communities.</p>
<p>Of the seven cities named in August, six were in England, one in Scotland, with Belfast failing to make the cut for Northern Ireland.</p>
<p>Requirements included “a suitable venue and sufficient space to deliver the requirements of the Song Contest”, necessary commitment to the contest including a financial contribution, and “alignment with the BBC’s strategic priorities as a public service broadcaster”.</p>
<p>Liverpool, which has been a Unesco City of Music since 2015, is synonymous with The Beatles and has a rich music heritage.</p>
<p>&nbsp;</p>

<blockquote class="twitter-tweet">
<p lang="en" dir="ltr">Let&#39;s get <a href="https://twitter.com/Eurovision?ref_src=twsrc%5Etfw">@Eurovision</a> to Liverpool. It&#39;s us or Glasgow 🤞🤞</p>
<p>RT our video which was used in the official bid below and let&#39;s get <a href="https://twitter.com/hashtag/Eurovision?src=hash&amp;ref_src=twsrc%5Etfw">#Eurovision</a> to make the right choice 🌇🎶 <a href="https://t.co/wYZHTQZVAU">pic.twitter.com/wYZHTQZVAU</a> </p>
<p>&mdash; The Guide Liverpool 🌇 (@TheGuideLpool) <a href="https://twitter.com/TheGuideLpool/status/1574755299331919873?ref_src=twsrc%5Etfw">September 27, 2022</a></p></blockquote>
<p> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script></p>

<p><strong>Mayor of Liverpool, Joanne Anderson said:</strong> “I’m so thrilled to hear Liverpool’s hopes of hosting Eurovision have moved a big step closer!</p>
<p>We all know our city is great at hosting big events – nobody throws a party like Liverpool – and the judges at Eurovision agree.</p>
<p>From The Beatles, to Cream, to the Royal Liverpool Philharmonic Orchestra – Liverpool always moves to its own beat – and hosting Eurovision would write a brand-new chapter in our musical heritage.</p>
<p>In the short term however, it will be a huge boost to the local economy and will also provide a platform to sustain jobs well into the future.</p>
<p>We are so proud to have the backing of our sister city in Ukraine – Odesa – and it would be a privilege to host Eurovision 2023 on behalf of them and the people of Ukraine.   </p>
<p>Glasgow is a great city and so I don’t envy the judges who have to decide between us, but for me there is no city anywhere in Europe which would make a more perfect home for Eurovision than Liverpool” </p>
<p><strong>Claire McColgan CBE, Director of Culture Liverpool, said: </strong>“The process of bidding for Eurovision has once again shown why Liverpool is such a brilliant event city.</p>
<p>Partners from across the region – from hoteliers to the police, ACC Liverpool to the local hospitals – have got behind our plans and really stepped up to help bring this to the city.”</p>
<p><strong>Steve Rotheram, Mayor of the Liverpool City Region, said: </strong>“It’s unsurprising that Liverpool has made it to the final two cities to host Eurovision because there’s nowhere better qualified or more fitting to host it than here in the UK’s cultural capital.</p>
<p>Our reputation as a music heavyweight is unmatched. Not only are we a UNESCO City of Music, but no region in the UK has had more number one hits.</p>
<p>We’ve shown time and time again that nowhere can throw a party quite like us – we’re ready to roll the red carpet out for a Eurovision celebration that the world will never forget!”</p>
<p>Phil Harrold, the chair of the BBC’s Host City Selection Committee said: “The Eurovision Song Contest is a very complex event and Liverpool and Glasgow have the strongest overall offer; we will continue our discussions with them to determine the eventual host city.”</p>
<h4>Share our Eurovision bid video on Twitter <a href="https://twitter.com/TheGuideLpool/status/1574755299331919873">HERE</a>.</h4>


*/