package ch.iict.dma.dmareflection

import android.annotation.SuppressLint
import android.app.Activity
import android.app.DatePickerDialog
import android.os.Bundle
import android.view.View
import android.view.inputmethod.InputMethodManager
import android.widget.DatePicker
import android.widget.EditText
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import ch.iict.dma.dmareflection.databinding.ActivityMainBinding
import ch.iict.dma.dmareflection.models.Person
import ch.iict.dma.lib.reflection.MySerializer
import java.text.SimpleDateFormat
import java.util.*


class MainActivity : AppCompatActivity(), DatePickerDialog.OnDateSetListener {

    private lateinit var binding : ActivityMainBinding

    @SuppressLint("ClickableViewAccessibility")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // depuis android 15 (sdk 35), le mode edge2edge doit être activé
        enableEdgeToEdge()

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // comme edge2edge est activé, l'application doit garder un espace suffisant pour la barre système
        ViewCompat.setOnApplyWindowInsetsListener(binding.main) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        // la barre d'action doit être définie dans le layout, on la lie à l'activité
        setSupportActionBar(binding.toolbar)

        // datepicker
        val cal = GregorianCalendar.getInstance()
        val datePickerDialog = DatePickerDialog(
            this,
            this,
            cal.get(Calendar.YEAR),
            cal.get(Calendar.MONTH),
            cal.get(Calendar.DAY_OF_MONTH)
        )
        binding.inputEdBirthdate.setOnTouchListener { view, _ ->
            hideKeyboard(this)
            datePickerDialog.show();
            view.performClick();
            true
        }

        // button's events
        binding.inputBtnSerialize.setOnClickListener {

            val fname = readTextFromEditText(binding.inputEdFirstname)
            val name = readTextFromEditText(binding.inputEdName)
            val height = readTextFromEditText(binding.inputEdHeight)
            val bday = readTextFromEditText(binding.inputEdBirthdate)

            if(fname.isBlank() || name.isBlank() || height.isBlank() || bday.isBlank()) {
                Toast.makeText(this, R.string.input_invalid, Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }

            val p = Person(fname, name,
                height.toInt(),
                DATE_FORMAT.parse(bday))


            val json = MySerializer.serialize(p)

            binding.serializedTvJson.setText(json)
        }

        binding.serializedBtnDeserialize.setOnClickListener {
            val json =  binding.serializedTvJson.text as String
            val person = MySerializer.deserialize(json, Person::class)

            binding.outputEdFirstname.setText(person.firstname)
            binding.outputEdName.setText(person.name)
            binding.outputEdHeight.setText("${person.height}")
            binding.outputEdBirthdate.setText(DATE_FORMAT.format(person.birthday))
        }

    }

    override fun onDateSet(view: DatePicker?, year: Int, month: Int, dayOfMonth: Int) {
        val cal = GregorianCalendar.getInstance().apply {
            set(Calendar.YEAR, year);
            set(Calendar.MONTH, month);
            set(Calendar.DAY_OF_MONTH, dayOfMonth);
            set(Calendar.HOUR, 0);
            set(Calendar.MINUTE, 0);
            set(Calendar.SECOND, 0);
            set(Calendar.MILLISECOND, 0);
        }.time
        binding.inputEdBirthdate.setText(DATE_FORMAT.format(cal))
        hideKeyboard(this)
    }

    companion object {
        val DATE_FORMAT = SimpleDateFormat("dd.MM.yyyy")

        private fun readTextFromEditText(editText: EditText) = editText.text.toString()

        private fun hideKeyboard(activity: Activity) {
            val imm = activity.getSystemService(INPUT_METHOD_SERVICE) as InputMethodManager
            //Find the currently focused view, so we can grab the correct window token from it.
            var view: View? = activity.currentFocus
            //If no view currently has focus, create a new one, just so we can grab a window token from it
            if (view == null) {
                view = View(activity)
            }
            imm.hideSoftInputFromWindow(view.windowToken, 0)
        }
    }

}