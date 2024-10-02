import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_app/features/onboarding/data/onboardingmodel.dart';

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Skip', style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
        ))],
        
      ),

      body:  OnboardingWitgetBody(),
    );
  }
}

class OnboardingWitgetBody extends StatelessWidget {
   OnboardingWitgetBody({super.key});
final PageController _controller = PageController();
int currantPage = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: PageView.builder(
      controller: _controller,
      itemCount: OnboardingData.length,
      itemBuilder: (context,i){
        return Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              
              child: Image.asset(OnboardingData[i].imagePath,fit: BoxFit.fill,)),
              const SizedBox(height: 20,),
            SmoothPageIndicator(controller: _controller, count: 3,
            effect: const ExpandingDotsEffect(
              
            ),
            ),
                          const SizedBox(height: 100,),

            Text(OnboardingData[i].title,style: const TextStyle(fontSize: 30),),
                                      const SizedBox(height: 20,),
             currantPage==OnboardingData.length-1 ?      
               ElevatedButton(onPressed: (){
                GoRouter.of(context).push('/home.dart');

            }, child: const Text('Go To Home')):

            ElevatedButton(onPressed: (){
              _controller.nextPage(duration: const Duration(microseconds: 200), curve: Curves.bounceIn);
              currantPage++;
            }, child: const Text('NEXT'))
            
           

          ],
        );



      }));
  }
}