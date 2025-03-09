import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WalletConfirmetionScreen extends StatelessWidget {
  const WalletConfirmetionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 28.9, 16.0, 16.0),
        child: Column(
          children: [
            // const SizedBox(
            //   height: 15,
            // ),
            Image.asset(
              'assets/images/Illustrtion.png',
              fit: BoxFit.contain,
            ),
            SizedBox(height: 16.0),
            Text(
              'Wallet confirmed!',
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/logo_small.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '04#ID..89Gr4',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'Your wallet address',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/copy.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/wallet_small.svg',
                  width: 40,
                  height: 40,
                ),
                SizedBox(width: 15.0),
                Expanded(
                  child: Text(
                    'Yeah, you\'re the proud owner of this wallet address.',
                    style: TextStyle(
                      fontFamily: 'Nunito Sans',
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.0),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/lock.svg',
                  width: 40,
                  height: 40,
                ),
                SizedBox(width: 15.0),
                Expanded(
                  child: Text(
                    'This is also an account number for receiving funds.',
                    style: TextStyle(
                      fontFamily: 'Nunito Sans',
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the secure wallet screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Secure Wallet',
                  style: TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
