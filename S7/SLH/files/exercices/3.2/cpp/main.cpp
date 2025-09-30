#include <iostream>
#include <string>

using namespace std;

string reverse(string str)
{
    string resp = "";

    for (int i = str.length() - 1; i >= 0; i--)
    {
        resp += str[i];
    }
    return resp;
}


// TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
int main()
{

    string str = "Hello World!";

    cout << "Content:     " << str << endl;
    cout << "Content rev: " << reverse(str) << endl;

}