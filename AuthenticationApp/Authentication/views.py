from django.shortcuts import redirect, render

# Create your views here.


def register(request):
    return render(request, 'register.html')


def home(request):
    return render(request, 'home.html')


def loginCheck(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        dummy_data = {'vishwa': 'v@123'}
        if dummy_data[username] == password:
            return redirect('home')

        else:
            return render(request, 'register.html', {'error': "Invalid Credentials"})
    else:
        return render(request, 'register.html')
